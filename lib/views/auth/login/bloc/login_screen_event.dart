part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent {}

class LoginScreenInitialEvent extends LoginScreenEvent {}

class EmailChangedEvent extends LoginScreenEvent {
  final String email;
  EmailChangedEvent(this.email);
}

class PasswordChangedEvent extends LoginScreenEvent {
  final String password;
  PasswordChangedEvent(this.password);
}

class EmailValidationErrorEvent extends LoginScreenEvent {}

class PasswordValidationErrorEvent extends LoginScreenEvent {}

class SubmitLoginEvent extends LoginScreenEvent {}

class LoginFailedEvent extends LoginScreenEvent {
  final String? errorMessage;
  LoginFailedEvent({this.errorMessage});
}

class LoginSuccessEvent extends LoginScreenEvent {}

class TogglePasswordVisibilityEvent extends LoginScreenEvent {}

class LoginSuccessState extends LoginScreenState {}
