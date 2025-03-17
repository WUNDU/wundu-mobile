import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Importe o flutter_screenutil
import 'package:wundu/core/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wundu/views/onboarding/bloc/onboarding_screen_bloc.dart';
import 'package:wundu/views/onboarding/models/onboarding_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';

class OnboardingContent {
  final String title;
  final String imagePath;

  OnboardingContent({required this.title, required this.imagePath});
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingScreenBloc>(
      create: (context) => OnboardingScreenBloc(OnboardingScreenState(
        onboardingScreenModelObj: OnboardingScreenModel(),
      ))
        ..add(OnboardingScreenInitiaEvent()),
      child: const OnboardingScreen(),
    );
  }

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final LocalPreferences _localPreferences = LocalPreferences();
  final PageController _pageController = PageController();
  final List<OnboardingContent> _contents = [
    OnboardingContent(
      title: "Administrar seu dinheiro está prestes a ficar muito melhor.",
      imagePath: ImageConstant.progress,
    ),
    OnboardingContent(
      title: "Pronto para assumir o controle de suas finanças?",
      imagePath: ImageConstant.personCoin,
    ),
    OnboardingContent(
      title: "A solução financeira sob medida para você está aqui.",
      imagePath: ImageConstant.coins,
    ),
  ];

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _contents.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _skipToLogin() {
    _completeOnboarding();
  }

  Future<void> _completeOnboarding() async {
    await _localPreferences.setOnboardingCompleted();
    NavigatorService.pushNamedAndRemovedUntil(AppRoutes.authScreen);
  }

  @override
  Widget build(BuildContext context) {
    // Inicialize o flutter_screenutil
    ScreenUtil.init(context, designSize: const Size(360, 800));

    // Verifique se o dispositivo é um tablet
    final bool isTablet = ScreenUtil().screenWidth > 600;

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: BlocBuilder<OnboardingScreenBloc, OnboardingScreenState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              backgroundColor: appTheme.whiteA700,
              body: Container(
                width: double.maxFinite,
                height: SizeUtils.height,
                decoration: AppDecoration.fillWhiteA,
                child: SafeArea(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        // Header com indicador e botão pular
                        Padding(
                          padding: EdgeInsets.only(
                            left: 14.w,
                            top: isTablet ? 80.w : 56.w, // Ajuste para tablet
                            right: 14.w,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 6.w,
                                child: AnimatedSmoothIndicator(
                                  activeIndex: _currentPage,
                                  count: _contents.length,
                                  effect: ScrollingDotsEffect(
                                    spacing: 10,
                                    activeDotColor: appTheme.yellowA700,
                                    dotColor: appTheme.blueGray100,
                                    dotHeight: 6.w,
                                    dotWidth: isTablet
                                        ? 70.w
                                        : 50.w, // Ajuste para tablet
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: _skipToLogin,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Pular",
                                        style: CustomTextStyles
                                            .titleSmallInterBluegray900,
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant.vector,
                                        height: 14.w,
                                        width: 14.w,
                                        margin: EdgeInsets.only(left: 4.w),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // PageView para conteúdo dinâmico
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemCount: _contents.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: isTablet
                                            ? 40.w
                                            : 22.w), // Ajuste para tablet
                                    SizedBox(
                                      width: 328.w,
                                      child: Text(
                                        _contents[index].title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.headlineLarge!
                                            .copyWith(
                                          height: 1.40,
                                          fontSize: isTablet
                                              ? 36.sp
                                              : 28.sp, // Ajuste para tablet
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: isTablet
                                            ? 60.w
                                            : 40.w), // Ajuste para tablet
                                    CustomImageView(
                                      imagePath: _contents[index].imagePath,
                                      height: isTablet
                                          ? 400.w
                                          : 310.w, // Ajuste para tablet
                                      width: double.maxFinite,
                                      margin: EdgeInsets.only(right: 28.w),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                        // Botão de próximo
                        Padding(
                          padding: EdgeInsets.only(
                            left: 14.w,
                            right: 14.w,
                            bottom:
                                isTablet ? 80.w : 56.w, // Ajuste para tablet
                          ),
                          child: CustomElevatedButton(
                            text: _currentPage < _contents.length - 1
                                ? "próximo"
                                : "começar",
                            buttonTextStyle: CustomTextStyles.titleLargeGray200
                                .copyWith(
                                    fontSize: isTablet
                                        ? 20.sp
                                        : 16.sp), // Ajuste para tablet
                            buttonStyle: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                isTablet ? 200.w : 150.w, // Ajuste para tablet
                                isTablet ? 60.w : 50.w, // Ajuste para tablet
                              ),
                            ),
                            onPressed: _nextPage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
