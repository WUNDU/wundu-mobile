part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent extends Equatable {
  const LoginScreenEvent();

  @override
  List<Object?> get props => [];
}

class LoginScreenInitialEvent extends LoginScreenEvent {
  @override
  List<Object?> get props => [];
}

class EmailValidationErrorEvent extends LoginScreenEvent {}

class PasswordValidationErrorEvent extends LoginScreenEvent {}

class LoginFailedEvent extends LoginScreenEvent {}

class EmailChangedEvent extends LoginScreenEvent {
  final String email;

  const EmailChangedEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class PasswordChangedEvent extends LoginScreenEvent {
  final String password;

  const PasswordChangedEvent(this.password);

  @override
  List<Object?> get props => [password];
}
