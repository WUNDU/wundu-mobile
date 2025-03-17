import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Importe o flutter_screenutil
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/session/activity_tracker.dart';
import 'package:wundu/core/session/session_service.dart';
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

class _HomeScreenState extends State<HomeScreen> with ActivityTracker {
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
    // Inicialize o flutter_screenutil
    ScreenUtil.init(context, designSize: const Size(360, 800));

    // Verifique se o dispositivo é um tablet
    final bool isTablet = ScreenUtil().screenWidth > 600;

    return FutureBuilder<Map<String, dynamic>?>(
      future: SessionService().getUserData(),
      builder: (context, snapshot) {
        final userData = snapshot.data;
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.blueGray50,
            appBar: CustomAppBar(
              userName: userData?['name'] ?? 'Usuário',
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
                      left: 12.w,
                      top: 16.w,
                      right: 12.w,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 14.w),
                        SizedBox(
                          height:
                              isTablet ? 250.w : 192.w, // Ajuste para tablet
                          width: double.maxFinite,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.rectangleCard,
                                height: isTablet
                                    ? 250.w
                                    : 192.w, // Ajuste para tablet
                                width: double.maxFinite,
                                radius: BorderRadius.circular(16.w),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(
                                    left: 10.w,
                                    top: 10.w,
                                    right: 10.w,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.menu,
                                        height: 24.w,
                                        width: 26.w,
                                        alignment: Alignment.centerRight,
                                        color: Colors.white,
                                        border: Border.all(),
                                        radius: BorderRadius.circular(18),
                                      ),
                                      CustomElevatedButton(
                                        height: isTablet
                                            ? 40.w
                                            : 34.w, // Ajuste para tablet
                                        text: "0 contas associadas",
                                        margin: EdgeInsets.only(
                                          left: isTablet
                                              ? 100.w
                                              : 84.w, // Ajuste para tablet
                                          right: isTablet
                                              ? 100.w
                                              : 82.w, // Ajuste para tablet
                                        ),
                                        buttonStyle:
                                            CustomButtonStyles.fillDeepOrange,
                                        buttonTextStyle: CustomTextStyles
                                            .bodyLargeDeeporange300,
                                      ),
                                      SizedBox(
                                          height: isTablet
                                              ? 16.w
                                              : 12.w), // Ajuste para tablet
                                      Text(
                                        "Valor total",
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                      SizedBox(height: 2.w),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant.ayeOff,
                                            color: Colors.white,
                                            height: 24.w,
                                            width: 24.w,
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
                        SizedBox(
                            height:
                                isTablet ? 40.w : 30.w), // Ajuste para tablet
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical:
                                isTablet ? 32.w : 26.w, // Ajuste para tablet
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
                                      height: isTablet
                                          ? 50.w
                                          : 40.w, // Ajuste para tablet
                                      width: isTablet
                                          ? 50.w
                                          : 40.w, // Ajuste para tablet
                                      padding: EdgeInsets.all(8.w),
                                      decoration:
                                          IconButtonStyleHelper.fillGray,
                                      child: CustomImageView(
                                        imagePath: ImageConstant.filter,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: isTablet
                                      ? 32.w
                                      : 24.w), // Ajuste para tablet
                              SizedBox(
                                width: double.maxFinite,
                                child: Divider(),
                              ),
                              SizedBox(
                                  height: isTablet
                                      ? 120.w
                                      : 90.w), // Ajuste para tablet
                              SizedBox(
                                width: double.maxFinite,
                                child: GestureDetector(
                                  onTap: () {
                                    onTapColumnmaterials(context);
                                  },
                                  child: Container(
                                    width: double.maxFinite,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: isTablet
                                            ? 60.w
                                            : 44.w), // Ajuste para tablet
                                    child: Column(
                                      children: [
                                        Container(
                                          height: isTablet
                                              ? 100.w
                                              : 80.w, // Ajuste para tablet
                                          width: isTablet
                                              ? 100.w
                                              : 82.w, // Ajuste para tablet
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
                                                height: isTablet
                                                    ? 50.w
                                                    : 40.w, // Ajuste para tablet
                                                width: isTablet
                                                    ? 52.w
                                                    : 42.w, // Ajuste para tablet
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: isTablet
                                                ? 16.w
                                                : 10.w), // Ajuste para tablet
                                        Text(
                                          "Sem movimentos para mostrar",
                                          style: CustomTextStyles
                                              .titleMediumBluegray900,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w),
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
