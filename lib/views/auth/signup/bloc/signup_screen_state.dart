part of 'signup_screen_bloc.dart';

class SignupScreenState extends Equatable {
  final SignupScreenModel? signupScreenModel;
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? numberController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final int currentStep;
  final bool isLoading;
  final String? errorMessage;

  const SignupScreenState({
    this.signupScreenModel,
    this.nameController,
    this.emailController,
    this.numberController,
    this.passwordController,
    this.confirmPasswordController,
    this.currentStep = 0,
    this.isLoading = false,
    this.errorMessage,
  });

  SignupScreenState copyWith({
    SignupScreenModel? signupScreenModel,
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? numberController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
    int? currentStep,
    bool? isLoading,
    String? errorMessage,
  }) {
    return SignupScreenState(
      signupScreenModel: signupScreenModel ?? this.signupScreenModel,
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      numberController: numberController ?? this.numberController,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController:
          confirmPasswordController ?? this.confirmPasswordController,
      currentStep: currentStep ?? this.currentStep,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        signupScreenModel,
        nameController,
        emailController,
        numberController,
        passwordController,
        confirmPasswordController,
        currentStep,
        isLoading,
        errorMessage,
      ];
}
