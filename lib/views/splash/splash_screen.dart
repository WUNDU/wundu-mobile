import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/splash/bloc/splash_screen_bloc.dart';
import 'package:wundu/views/splash/models/splash_screen_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashScreenBloc>(
      create: (context) => SplashScreenBloc(SplashScreenState(
        splashScreenModelObj: SplashScreenModel(),
      ))
        ..add(SplashScreenInitialEvent()),
      child: SplashScreen(),
    );
  }

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);

    _fadeInAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashScreenBloc, SplashScreenState>(
        builder: (context, state) {
      return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          decoration: AppDecoration.gradient2,
          child: SafeArea(
              child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeInAnimation,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: 0.8 + (_animationController.value * 0.2),
                        child: child,
                      );
                    },
                    child: CustomImageView(
                      imagePath: ImageConstant.logoWhite,
                      height: 650.h,
                      width: 650.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
          )),
        ),
      );
    });
  }
}
