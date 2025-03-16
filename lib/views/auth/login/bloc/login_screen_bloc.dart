import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wundu/views/auth/login/models/login_screen_model.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc(super.initialState) {
    on<LoginScreenInitialEvent>(_onInitialize);
    on<EmailValidationErrorEvent>(_onEmailValidationError);
    on<PasswordValidationErrorEvent>(_onPasswordValidationError);
    on<LoginFailedEvent>(_onLoginFailed);
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
  }

  _onInitialize(
    LoginScreenInitialEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    emit(state.copyWith(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      isEmailValid: true,
      isPasswordValid: true,
      hasError: false,
    ));
  }

  _onEmailValidationError(
    EmailValidationErrorEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    emit(state.copyWith(
      isEmailValid: false,
      hasError: true,
    ));
  }

  _onPasswordValidationError(
    PasswordValidationErrorEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    emit(state.copyWith(
      isPasswordValid: false,
      hasError: true,
    ));
  }

  _onLoginFailed(
    LoginFailedEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    emit(state.copyWith(
      hasError: true,
      isEmailValid: false,
      isPasswordValid: false,
    ));
  }

  _onEmailChanged(
    EmailChangedEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    // Quando o usuário começa a digitar novamente, removemos o estado de erro
    emit(state.copyWith(
      isEmailValid: true,
      hasError: false,
    ));
  }

  _onPasswordChanged(
    PasswordChangedEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    // Quando o usuário começa a digitar novamente, removemos o estado de erro
    emit(state.copyWith(
      isPasswordValid: true,
      hasError: false,
    ));
  }
}
