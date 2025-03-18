import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/session/activity_tracker.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/home/bloc/home_screen_bloc.dart';
import 'package:wundu/views/home/models/home_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_icon_button.dart';

// Conteúdo da Home Screen separado do Scaffold
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ActivityTracker {
  @override
  Widget build(BuildContext context) {
    // Inicialize o flutter_screenutil
    ScreenUtil.init(context, designSize: const Size(360, 800));

    // Verifique se o dispositivo é um tablet
    final bool isTablet = ScreenUtil().screenWidth > 600;

    return BlocProvider<HomeScreenBloc>(
      create: (context) => HomeScreenBloc(HomeScreenState(
        homeScreenModelObj: HomeScreenModel(),
      ))
        ..add(HomeScreenInitialEvent()),
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          return SafeArea(
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
                        height: isTablet ? 250.w : 192.w, // Ajuste para tablet
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
                      SizedBox(
                          height: isTablet ? 40.w : 30.w), // Ajuste para tablet
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
                                    decoration: IconButtonStyleHelper.fillGray,
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
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder40,
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant.moneyOff,
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.w),
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
                          ],
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
