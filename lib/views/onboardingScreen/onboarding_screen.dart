import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wundu/core/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wundu/views/onboardingScreen/bloc/onboarding_screen_bloc.dart';
import 'package:wundu/views/onboardingScreen/models/onboarding_screen_model.dart';
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
  // Controlador para o PageView
  final PageController _pageController = PageController();

  // Lista de conteúdos para o onboarding
  final List<OnboardingContent> _contents = [
    OnboardingContent(
      title: "Administrar seu dinheiro está prestes a ficar muito melhor.",
      imagePath: ImageConstant.progress,
    ),
    OnboardingContent(
      title: "Pronto para assumir o controle de suas finanças?",
      imagePath: ImageConstant
          .personCoin, // Substitua pelo caminho correto da segunda imagem
    ),
    OnboardingContent(
      title: "A solução financeira sob medida para você está aqui.",
      imagePath: ImageConstant
          .coins, // Substitua pelo caminho correto da terceira imagem
    ),
  ];

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Navega para a próxima página ou para a tela de login se estiver na última
  void _nextPage() {
    if (_currentPage < _contents.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Na última página, navega para a tela de login
      NavigatorService.pushNamedAndRemovedUntil(
        AppRoutes.authScreen,
      );
    }
  }

  // Pula para a tela de login
  void _skipToLogin() {
    NavigatorService.pushNamedAndRemovedUntil(
      AppRoutes.authScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Impede que o usuário volte para a splash screen usando o botão de voltar
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Se pressionar voltar, sai do app ao invés de voltar para o splash
        SystemNavigator.pop();
        return false;
      },
      child: BlocBuilder<OnboardingScreenBloc, OnboardingScreenState>(
        builder: (context, state) {
          return Scaffold(
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
                          left: 14.h,
                          top: 56.h,
                          right: 14.h,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 6.h,
                              child: AnimatedSmoothIndicator(
                                activeIndex: _currentPage,
                                count: _contents.length,
                                effect: ScrollingDotsEffect(
                                  spacing: 10,
                                  activeDotColor: appTheme.yellowA700,
                                  dotColor: appTheme.blueGray100,
                                  dotHeight: 6.h,
                                  dotWidth: 50.h,
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
                                      height: 14.h,
                                      width: 14.h,
                                      margin: EdgeInsets.only(left: 4.h),
                                    ),
                                  ],
                                ),
                              ),
                            )
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
                              padding: EdgeInsets.symmetric(horizontal: 14.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 22.h),
                                  SizedBox(
                                    width: 328.h,
                                    child: Text(
                                      _contents[index].title,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.headlineLarge!
                                          .copyWith(
                                        height: 1.40,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40.h),
                                  CustomImageView(
                                    imagePath: _contents[index].imagePath,
                                    height: 310.h,
                                    width: double.maxFinite,
                                    margin: EdgeInsets.only(right: 28.h),
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
                          left: 14.h,
                          right: 14.h,
                          bottom: 56.h,
                        ),
                        child: CustomElevatedButton(
                          text: _currentPage < _contents.length - 1
                              ? "próximo"
                              : "começar",
                          buttonTextStyle: CustomTextStyles.titleLargeGray200,
                          onPressed: _nextPage,
                        ),
                      ),
                    ],
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
