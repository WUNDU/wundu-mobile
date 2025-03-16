import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/home/bloc/home_screen_bloc.dart';
import 'package:wundu/views/home/models/home_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_icon_button.dart';

class HomeScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: appTheme.blueGray50,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 74.h,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 14.h,
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                color: appTheme.whiteA700,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.logoHome,
                          height: 50.h,
                          width: 50.h,
                          radius: BorderRadius.circular(
                            24.h,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nilvany Tiago",
                                style: theme.textTheme.titleMedium,
                              ),
                              Text(
                                "Bem-vindo ao wundu",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        CustomIconButton(
                          height: 40.h,
                          width: 40.h,
                          padding: EdgeInsets.all(8.h),
                          decoration: IconButtonStyleHelper.outlineIndigoA,
                          child: CustomImageView(
                            imagePath: ImageConstant.wunduIA,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 10)),
                        CustomIconButton(
                          height: 40.h,
                          width: 40.h,
                          padding: EdgeInsets.all(8.h),
                          decoration: IconButtonStyleHelper.fillBlueGray,
                          child: CustomImageView(
                            imagePath: ImageConstant.notification,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                                      // imagePath: ImageConstant.imgNotification,
                                      height: 34.h,
                                      width: 36.h,
                                      alignment: Alignment.centerRight,
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
                                          // imagePath:
                                          //     ImageConstant.imgEyeWhiteA700,
                                          height: 24.h,
                                          width: 24.h,
                                          alignment: Alignment.bottomCenter,
                                        ),
                                        Text(
                                          "************",
                                          style: theme.textTheme.headlineSmall,
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
                                    "1bl_movimenta_es".toUpperCase(),
                                    style: CustomTextStyles
                                        .titleSmallInterBluegray900SemiBold,
                                  ),
                                  CustomIconButton(
                                    height: 40.h,
                                    width: 40.h,
                                    padding: EdgeInsets.all(8.h),
                                    decoration: IconButtonStyleHelper.fillGray,
                                    child: CustomImageView(
                                        // imagePath: ImageConstant.imgUser,
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
                            SizedBox(height: 240.h),
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
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder40,
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CustomImageView(
                                              // imagePath: ImageConstant
                                              //     .imgMaterialSymbol,
                                              height: 40.h,
                                              width: 42.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "msg_sem movimentos_para",
                                        style: CustomTextStyles
                                            .titleMediumBluegray900,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.h),
                                        child: Text(
                                          "msg_registro_um_cart_o",
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
          bottomNavigationBar: Container(
            height: 80.h, // Increased from 68.h to accommodate content
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              color: appTheme.whiteA700,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(32.h),
              ),
            ),
            // Use a Row instead of BottomNavigationBar for more control
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Home
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.home,
                      height: 30.h,
                      width: 30.h,
                    ),
                    Text(
                      "Home",
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                // Cards
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.creditCard,
                      height: 30.h,
                      width: 30.h,
                    ),
                    Text(
                      "Cartões",
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                // Center button
                CustomImageView(
                  imagePath: ImageConstant.logoHome,
                  height: 50.h,
                  width: 52.h,
                ),
                // Library
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.digitalLibrary,
                      height: 30.h,
                      width: 32.h,
                    ),
                    Text(
                      "Biblioteca",
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                // Profile
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.user,
                      height: 22.h,
                      width: 22.h,
                    ),
                    Text(
                      "Perfil",
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Navigates to the homeScreen when the action is triggered.
  onTapColumnmaterials(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }
}
