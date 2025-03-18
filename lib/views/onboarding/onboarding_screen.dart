import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wundu/core/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wundu/views/onboarding/bloc/onboarding_screen_bloc.dart';
import 'package:wundu/views/onboarding/models/onboarding_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:responsive_framework/responsive_framework.dart'; // Importe o responsive_framework

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
    // Verifique o tamanho da tela usando o responsive_framework
    // ignore: unused_local_variable
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

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
                            left: isTablet ? 24 : 14,
                            top: isTablet ? 80 : 56, // Ajuste para tablet
                            right: isTablet ? 24 : 14,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 6,
                                child: AnimatedSmoothIndicator(
                                  activeIndex: _currentPage,
                                  count: _contents.length,
                                  effect: ScrollingDotsEffect(
                                    spacing: 10,
                                    activeDotColor: appTheme.yellowA700,
                                    dotColor: appTheme.blueGray100,
                                    dotHeight: 6,
                                    dotWidth: isTablet
                                        ? 70
                                        : 50, // Ajuste para tablet
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
                                        height: 14,
                                        width: 14,
                                        margin: EdgeInsets.only(left: 4),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: isTablet ? 24 : 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: isTablet
                                            ? 40
                                            : 22), // Ajuste para tablet
                                    SizedBox(
                                      width: isTablet
                                          ? 600
                                          : 328, // Ajuste para tablet
                                      child: Text(
                                        _contents[index].title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.headlineLarge!
                                            .copyWith(
                                          height: 1.40,
                                          fontSize: isTablet
                                              ? 36
                                              : 28, // Ajuste para tablet
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: isTablet
                                            ? 60
                                            : 40), // Ajuste para tablet
                                    CustomImageView(
                                      imagePath: _contents[index].imagePath,
                                      height: isTablet
                                          ? 400
                                          : 310, // Ajuste para tablet
                                      width: double.maxFinite,
                                      margin: EdgeInsets.only(
                                          right: isTablet ? 40 : 28),
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
                            left: isTablet ? 24 : 14,
                            right: isTablet ? 24 : 14,
                            bottom: isTablet ? 80 : 56, // Ajuste para tablet
                          ),
                          child: CustomElevatedButton(
                            text: _currentPage < _contents.length - 1
                                ? "próximo"
                                : "começar",
                            buttonTextStyle:
                                CustomTextStyles.titleLargeGray200.copyWith(
                              fontSize:
                                  isTablet ? 20 : 16, // Ajuste para tablet
                            ),
                            buttonStyle: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                isTablet ? 200 : 150, // Ajuste para tablet
                                isTablet ? 60 : 50, // Ajuste para tablet
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
