import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wundu/services/api_service.dart';
import 'package:wundu/views/auth/login/models/login_screen_model.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc(super.initialState) {
    on<LoginScreenInitialEvent>(_onInitialize);
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<EmailValidationErrorEvent>(_onEmailValidationError);
    on<PasswordValidationErrorEvent>(_onPasswordValidationError);
    on<SubmitLoginEvent>(_onSubmitLogin);
    on<LoginFailedEvent>(_onLoginFailed);
    on<LoginSuccessEvent>(_onLoginSuccess);
  }

  _onInitialize(
    LoginScreenInitialEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    emit(
      state.copyWith(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        isEmailValid: true,
        isPasswordValid: true,
        hasError: false,
        isLoading: false,
        errorMessage: null,
      ),
    );
  }

  _onEmailChanged(
    EmailChangedEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    emit(state.copyWith(
      isEmailValid: true,
      hasError: false,
      errorMessage: null,
    ));
  }

  _onPasswordChanged(
    PasswordChangedEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    emit(state.copyWith(
      isPasswordValid: true,
      hasError: false,
      errorMessage: null,
    ));
  }

  _onEmailValidationError(
    EmailValidationErrorEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    emit(state.copyWith(
      isEmailValid: false,
    ));
  }

  _onPasswordValidationError(
    PasswordValidationErrorEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    emit(state.copyWith(
      isPasswordValid: false,
    ));
  }

  _onSubmitLogin(
    SubmitLoginEvent event,
    Emitter<LoginScreenState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: null));

    try {
      final response = await ApiService.loginUser(
        email: state.emailController!.text,
        password: state.passwordController!.text,
      );

      if (response['success']) {
        add(LoginSuccessEvent());
      } else {
        add(LoginFailedEvent(errorMessage: response['message']));
      }
    } catch (e) {
      add(LoginFailedEvent(errorMessage: 'An error occurred: ${e.toString()}'));
    }
  }

  _onLoginFailed(
    LoginFailedEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    emit(state.copyWith(
      isLoading: false,
      hasError: true,
      errorMessage: event.errorMessage ?? 'Login failed. Please try again.',
    ));
  }

  _onLoginSuccess(
    LoginSuccessEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    emit(state.copyWith(
      isLoading: false,
      hasError: false,
      errorMessage: null,
    ));
    // Navigation will be handled by the BlocListener in the UI
  }
}
