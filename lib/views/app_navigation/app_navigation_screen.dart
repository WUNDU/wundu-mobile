import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/app_navigation/bloc/app_navigation_bloc.dart';
import 'package:wundu/views/app_navigation/models/app_navigation_model.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(AppNavigationState(
        appNavigationModelObj: AppNavigationModel(),
      ))
        ..add(AppNavigationInitialEvent()),
      child: AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0XFFFFFFFF),
          body: SafeArea(
            child: SizedBox(
              width: 375.h,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          child: Text(
                            "App Navigation",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 20.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Text(
                            "Check your app's UI from the below demo screens of your app.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0XFF888888),
                              fontSize: 16.fSize,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Divider(
                          height: 1.h,
                          thickness: 1.h,
                          color: Color(0XFF000000),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                        ),
                        child: Column(
                          children: [
                            buildScreenTitle(
                              context,
                              screenTitle: "Login",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.loginScreen),
                            ),
                            buildScreenTitle(
                              context,
                              screenTitle: "Splash Screen",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.splashScreen),
                            ),
                            buildScreenTitle(
                              context,
                              screenTitle: "Onboarding Screen",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.onboardScreen),
                            ),
                            buildScreenTitle(
                              context,
                              screenTitle: "Auth Screen",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.authScreen),
                            ),
                            buildScreenTitle(
                              context,
                              screenTitle: "Signup Personal Data",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.signupPersonalDataScreen),
                            ),
                            buildScreenTitle(
                              context,
                              screenTitle: "Signup Password Data",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.signupPasswordDataScreen),
                            ),
                            buildScreenTitle(
                              context,
                              screenTitle: "Signup Confirmation",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.signupConfirmScreen),
                            ),
                            buildScreenTitle(
                              context,
                              screenTitle: "Main Screen",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.mainScreen),
                            ),
                            buildScreenTitle(
                              context,
                              screenTitle: "Add Card Manual",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.addCardManualScreen),
                            ),
                            buildScreenTitle(
                              context,
                              screenTitle: "Transaction Details",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.transactionDetailsScreen),
                            ),
                            buildScreenTitle(
                              context,
                              screenTitle: "Add Category",
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.addCategoryScreen),
                            ),
                            buildScreenTitle(
                              context,
                              screenTitle: "Notifications",
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.notificationScreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Common click event for dialog
  void onTapDialogTitle(BuildContext context, Widget className) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: className,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
        );
      },
    );
  }

  /// Common widget
  Widget buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                screenTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 5.h),
            Divider(
              height: 1.h,
              thickness: 1.h,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
