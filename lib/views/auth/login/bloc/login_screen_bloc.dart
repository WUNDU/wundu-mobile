import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/session/session_service.dart';
import 'package:wundu/services/api_service.dart';
import 'package:wundu/views/auth/login/models/login_screen_model.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final SessionService _sessionService = SessionService();
  LoginScreenBloc(super.initialState) {
    on<LoginScreenInitialEvent>(_onInitialize);
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<EmailValidationErrorEvent>(_onEmailValidationError);
    on<PasswordValidationErrorEvent>(_onPasswordValidationError);
    on<SubmitLoginEvent>(_onSubmitLogin);
    on<LoginFailedEvent>(_onLoginFailed);
    on<LoginSuccessEvent>(_onLoginSuccess);
    on<TogglePasswordVisibilityEvent>(_onTogglePasswordVisibility);
    on<LoadLastUsedEmailEvent>(_onLoadLastUsedEmail);
  }

  _onInitialize(
    LoginScreenInitialEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    add(LoadLastUsedEmailEvent());
    emit(
      state.copyWith(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        isEmailValid: true,
        isPasswordValid: true,
        hasError: false,
        isLoading: false,
        errorMessage: null,
        isPasswordVisible: false,
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

  _onLoadLastUsedEmail(
      LoadLastUsedEmailEvent event, Emitter<LoginScreenState> emit) async {
    final lastEmail = await LocalPreferences().getLastUsedEmail();
    emit(state.copyWith(lastUsedEmail: lastEmail));
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

  _onTogglePasswordVisibility(
    TogglePasswordVisibilityEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    emit(state.copyWith(
      isPasswordVisible: !state.isPasswordVisible,
    ));
  }

  _onSubmitLogin(SubmitLoginEvent event, Emitter<LoginScreenState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: null));

    try {
      // Use actual API call instead of mock data
      final response = await ApiService.loginUser(
        email: state.emailController!.text,
        password: state.passwordController!.text,
      );

      if (response['success']) {
        await _sessionService.saveSession(
          response['token'],
          response['data']['userDTO'],
        );
        emit(state.copyWith(
            isLoading: false)); // Atualiza o estado antes da navegação
        add(LoginSuccessEvent());
      } else {
        add(LoginFailedEvent(errorMessage: response['message']));
      }
    } catch (e) {
      add(LoginFailedEvent(errorMessage: 'Ocorreu um erro: ${e.toString()}'));
    }
  }

  _onLoginFailed(
    LoginFailedEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    String displayMessage =
        event.errorMessage ?? 'Falha no login. Por favor, tente novamente.';

    // Clean up the message if it contains FormatException details
    if (displayMessage.contains('FormatException')) {
      displayMessage =
          'Não foi possível ligar ao servidor. Verifique a sua ligação à internet.';
    }

    emit(state.copyWith(
      isLoading: false,
      hasError: true,
      errorMessage:
          event.errorMessage ?? 'Falha no login. Por favor, tente novamente.',
    ));
  }

  _onLoginSuccess(
    LoginSuccessEvent event,
    Emitter<LoginScreenState> emit,
  ) {
    emit(
        LoginSuccessState()); // Navigation will be handled by the BlocListener in the UI
  }
}
