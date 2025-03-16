import 'package:flutter/material.dart';
import 'package:wundu/views/auth/auth_screen.dart';
import 'package:wundu/views/auth/login/login_screen.dart';
import 'package:wundu/views/auth/signup/signup_confirm_screen.dart';
import 'package:wundu/views/auth/signup/signup_password_data_screen.dart';
import 'package:wundu/views/auth/signup/signup_personal_data_screen.dart';
import 'package:wundu/views/onboarding/onboarding_screen.dart';
import 'package:wundu/views/splash/splash_screen.dart';

class AppRoutes {
  static const loginScreen = '/login_screen';
  static const splashScreen = '/splash_screen';
  static const onboardScreen = '/onboard_screen';
  static const authScreen = '/auth_screen';
  static const signupPersonalDataScreen = '/signup_personal_data_screen';
  static const signupPasswordDataScreen = '/signup_password_data_screen';
  static const signupConfirmScreenScreen = '/signup_confirm_screen';

  static Map<String, WidgetBuilder> get routes => {
        loginScreen: LoginScreen.builder,
        splashScreen: SplashScreen.builder,
        onboardScreen: OnboardingScreen.builder,
        authScreen: AuthScreen.builder,
        signupPersonalDataScreen: SignupPersonalDataScreen.builder,
        signupPasswordDataScreen: SignupPasswordDataScreen.builder,
        signupConfirmScreenScreen: SignupConfirmScreenScreen.builder
      };
}
