part of 'login_screen_bloc.dart';

class LoginScreenState extends Equatable {
  final LoginScreenModel? loginModelObj;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool hasError;
  final bool isLoading;
  final String? errorMessage;
  final bool isPasswordVisible;

  const LoginScreenState({
    this.loginModelObj,
    this.emailController,
    this.passwordController,
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.hasError = false,
    this.isLoading = false,
    this.errorMessage,
    this.isPasswordVisible = false,
  });

  LoginScreenState copyWith({
    LoginScreenModel? loginModelObj,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? hasError,
    bool? isLoading,
    String? errorMessage,
    bool? isPasswordVisible,
  }) {
    return LoginScreenState(
      loginModelObj: loginModelObj ?? this.loginModelObj,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [
        loginModelObj,
        emailController,
        passwordController,
        isEmailValid,
        isPasswordValid,
        hasError,
        isLoading,
        errorMessage,
        isPasswordVisible,
      ];
}
