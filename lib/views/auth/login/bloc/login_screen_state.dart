part of 'login_screen_bloc.dart';

class LoginScreenState extends Equatable {
  final LoginModel? loginModelObj;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool hasError;

  const LoginScreenState({
    this.loginModelObj,
    this.emailController,
    this.passwordController,
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.hasError = false,
  });

  @override
  List<Object?> get props => [
        loginModelObj,
        emailController,
        passwordController,
        isEmailValid,
        isPasswordValid,
        hasError,
      ];

  LoginScreenState copyWith({
    LoginModel? loginModelObj,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? hasError,
  }) {
    return LoginScreenState(
      loginModelObj: loginModelObj ?? this.loginModelObj,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      hasError: hasError ?? this.hasError,
    );
  }
}
