import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/home/bloc/home_screen_bloc.dart';
import 'package:wundu/views/home/models/home_screen_model.dart';
import 'package:wundu/widgets/custom_app_bar.dart';
import 'package:wundu/widgets/custom_bottom_nav_bar.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeScreenBloc>(
      create: (context) => HomeScreenBloc(HomeScreenState(
        homeScreenModelObj: HomeScreenModel(),
      ))
        ..add(HomeScreenInitialEvent()),
      child: HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Índice atual da navegação

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Lógica de navegação com base no índice
    switch (index) {
      case 0:
        // Já estamos na Home, não precisa fazer nada
        break;
      case 1:
        // Navegação para a tela de Cartões
        NavigatorService.pushNamed(AppRoutes.cardScreen);
        break;
      case 2:
        // Ação para o botão central
        // Implemente conforme necessário
        break;
      case 3:
        // Navegação para a tela de Biblioteca
        // NavigatorService.pushNamed(AppRoutes.libraryScreen);
        break;
      case 4:
        // Navegação para a tela de Perfil
        // NavigatorService.pushNamed(AppRoutes.profileScreen);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.blueGray50,
            appBar: CustomAppBar(
              userName: 'Nilvany Tiago',
              welcomeMessage: "Bem-vindo ao wundu",
            ),
            body: SafeArea(
              top: false,
              child: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 16.h,
                      right: 12.h,
                    ),
                    child: Column(
                      spacing: 30,
                      children: [
                        SizedBox(height: 14.h),
                        SizedBox(
                          height: 192.h,
                          width: double.maxFinite,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.rectangleCard,
                                height: 192.h,
                                width: double.maxFinite,
                                radius: BorderRadius.circular(
                                  16.h,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(
                                    left: 10.h,
                                    top: 10.h,
                                    right: 10.h,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.menu,
                                        height: 24.h,
                                        width: 26.h,
                                        alignment: Alignment.centerRight,
                                        color: Colors.white,
                                        border: Border.all(),
                                        radius: BorderRadius.circular(18),
                                      ),
                                      CustomElevatedButton(
                                        height: 34.h,
                                        text: "0 contas associadas",
                                        margin: EdgeInsets.only(
                                          left: 84.h,
                                          right: 82.h,
                                        ),
                                        buttonStyle:
                                            CustomButtonStyles.fillDeepOrange,
                                        buttonTextStyle: CustomTextStyles
                                            .bodyLargeDeeporange300,
                                      ),
                                      SizedBox(height: 12.h),
                                      Text(
                                        "Valor total",
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                      SizedBox(height: 2.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant.ayeOff,
                                            color: Colors.white,
                                            height: 24.h,
                                            width: 24.h,
                                            alignment: Alignment.bottomCenter,
                                          ),
                                          Text(
                                            " ************",
                                            style:
                                                theme.textTheme.headlineSmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.h,
                            vertical: 26.h,
                          ),
                          decoration: AppDecoration.outlineGray.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder16,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Movimentações".toUpperCase(),
                                      style: CustomTextStyles
                                          .titleSmallInterBluegray900SemiBold,
                                    ),
                                    CustomIconButton(
                                      height: 40.h,
                                      width: 40.h,
                                      padding: EdgeInsets.all(8.h),
                                      decoration:
                                          IconButtonStyleHelper.fillGray,
                                      child: CustomImageView(
                                        imagePath: ImageConstant.filter,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 24.h),
                              SizedBox(
                                width: double.maxFinite,
                                child: Divider(),
                              ),
                              SizedBox(height: 90.h),
                              SizedBox(
                                width: double.maxFinite,
                                child: GestureDetector(
                                  onTap: () {
                                    onTapColumnmaterials(context);
                                  },
                                  child: Container(
                                    width: double.maxFinite,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 44.h),
                                    child: Column(
                                      spacing: 10,
                                      children: [
                                        Container(
                                          height: 80.h,
                                          width: 82.h,
                                          decoration:
                                              AppDecoration.fillBlack.copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder40,
                                          ),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.moneyOff,
                                                height: 40.h,
                                                width: 42.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "Sem movimentos para mostrar",
                                          style: CustomTextStyles
                                              .titleMediumBluegray900,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.h),
                                          child: Text(
                                            "Registre um cartão e começe a ver seus movimentos",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: CustomTextStyles
                                                .bodySmallInterBluegray900
                                                .copyWith(
                                              height: 2.08,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: _currentIndex,
              onTap: _onNavItemTapped,
            ),
          ),
        );
      },
    );
  }

  /// Navigates to the homeScreen when the action is triggered.
  void onTapColumnmaterials(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }
}
