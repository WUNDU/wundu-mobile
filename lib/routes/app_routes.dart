import 'package:flutter/material.dart';
import 'package:wundu/views/app_navigation/app_navigation_screen.dart';
import 'package:wundu/views/auth/auth_screen.dart';
import 'package:wundu/views/auth/login/login_screen.dart';
import 'package:wundu/views/auth/signup/signup_confirm_screen.dart';
import 'package:wundu/views/auth/signup/signup_password_data_screen.dart';
import 'package:wundu/views/auth/signup/signup_personal_data_screen.dart';
import 'package:wundu/views/card/add_card_manual/add_card_manual_screen.dart';
import 'package:wundu/views/control_panel/control_panel.dart';
import 'package:wundu/views/notification/notification_screen.dart';
import 'package:wundu/views/onboarding/onboarding_screen.dart';
import 'package:wundu/views/profile/profile.dart';
import 'package:wundu/views/splash/splash_screen.dart';
import 'package:wundu/views/transaction_details/add_category/add_category_screen.dart';
import 'package:wundu/views/transaction_details/transaction_details_screen.dart';
import 'package:wundu/widgets/main_scaffold.dart';

class AppRoutes {
  static const loginScreen = '/login_screen';
  static const splashScreen = '/splash_screen';
  static const onboardScreen = '/onboard_screen';
  static const authScreen = '/auth_screen';
  static const signupPersonalDataScreen = '/signup_personal_data_screen';
  static const signupPasswordDataScreen = '/signup_password_data_screen';
  static const signupConfirmScreen = '/signup_confirm_screen';
  static const mainScreen = '/main_screen';
  static const addCardManualScreen = '/add_card_manual_screen';
  static const transactionDetailsScreen = '/transaction_details_screen';
  static const addCategoryScreen = '/add_category_screen';
  static const notificationScreen = '/notification';
  static const appNavigation = '/app_navigation';
  static const profile = '/profile';
  static const controlPanel = '/control_panel';

  static Map<String, WidgetBuilder> get routes => {
        loginScreen: LoginScreen.builder,
        splashScreen: SplashScreen.builder,
        onboardScreen: OnboardingScreen.builder,
        authScreen: AuthScreen.builder,
        signupPersonalDataScreen: SignupPersonalDataScreen.builder,
        signupPasswordDataScreen: SignupPasswordDataScreen.builder,
        signupConfirmScreen: SignupConfirmScreen.builder,
        mainScreen: MainScaffold.builder,
        addCardManualScreen: AddCardManualScreen.builder,
        transactionDetailsScreen: TransactionDetailsScreen.builder,
        addCategoryScreen: AddCategoryScreen.builder,
        notificationScreen: NotificationScreen.builder,
        appNavigation: AppNavigationScreen.builder,
        profile: ProfileScreen.builder,
        controlPanel: ControlPanelScreen.builder,
      };
}
