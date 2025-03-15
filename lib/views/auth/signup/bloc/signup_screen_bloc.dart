import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wundu/views/auth/signup/models/signup_screen_model.dart';

part 'signup_screen_event.dart';
part 'signup_screen_state.dart';

class SignupScreenBloc extends Bloc<SignupScreenEvent, SignupScreenState> {
  SignupScreenBloc(super.initialState) {
    on<SignupScreenInitialEvent>(_onInitialize);
    on<ChangeStepEvent>(_onChangeStep);
    on<CompleteRegistrationEvent>(_onCompleteRegistration);
  }

  _onInitialize(
    SignupScreenInitialEvent event,
    Emitter<SignupScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        nameController: TextEditingController(),
        emailController: TextEditingController(),
        numberController: TextEditingController(),
        passwordController: TextEditingController(),
        confirmPasswordController: TextEditingController(),
        isRegistrationComplete: false,
        currentStep: 0,
      ),
    );
  }

  _onChangeStep(
    ChangeStepEvent event,
    Emitter<SignupScreenState> emit,
  ) async {
    // Quando mudar para a etapa de senha, limpe os controladores de senha
    // para garantir que os campos comecem vazios
    if (event.step == 1) {
      state.passwordController?.clear();
      state.confirmPasswordController?.clear();
    }

    emit(
      state.copyWith(
        currentStep: event.step,
      ),
    );
  }

  _onCompleteRegistration(
    CompleteRegistrationEvent event,
    Emitter<SignupScreenState> emit,
  ) async {
    // Aqui você pode adicionar chamadas de API ou outra lógica para completar o registro

    // Verifica se as senhas são iguais antes de completar o registro
    final password = state.passwordController?.text ?? '';
    final confirmPassword = state.confirmPasswordController?.text ?? '';

    if (password == confirmPassword) {
      emit(
        state.copyWith(
          isRegistrationComplete: true,
        ),
      );
    }
  }
}
