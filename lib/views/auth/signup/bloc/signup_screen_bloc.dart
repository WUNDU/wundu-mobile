import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wundu/core/mocks/user_mocks.dart';
import 'package:wundu/views/auth/signup/models/signup_screen_model.dart';

part 'signup_screen_event.dart';
part 'signup_screen_state.dart';

class SignupScreenBloc extends Bloc<SignupScreenEvent, SignupScreenState> {
  SignupScreenBloc(super.initialState) {
    on<SignupScreenInitialEvent>(_onInitialize);
    on<ChangeStepEvent>(_onChangeStep);
    on<PreparePhoneNumberEvent>(_onPreparePhoneNumber);
    on<CompleteRegistrationEvent>(_onCompleteRegistration);
  }

  _onInitialize(
    SignupScreenInitialEvent event,
    Emitter<SignupScreenState> emit,
  ) {
    emit(
      state.copyWith(
        nameController: TextEditingController(),
        emailController: TextEditingController(),
        numberController: TextEditingController(),
        passwordController: TextEditingController(),
        confirmPasswordController: TextEditingController(),
        currentStep: 0,
        isLoading: false,
        errorMessage: null,
        processedPhoneNumber: null,
      ),
    );
  }

  _onChangeStep(
    ChangeStepEvent event,
    Emitter<SignupScreenState> emit,
  ) {
    emit(state.copyWith(
      currentStep: event.step,
    ));
  }

  _onPreparePhoneNumber(
    PreparePhoneNumberEvent event,
    Emitter<SignupScreenState> emit,
  ) {
    emit(state.copyWith(
      processedPhoneNumber: event.phoneNumber,
    ));
  }

  _onCompleteRegistration(
    CompleteRegistrationEvent event,
    Emitter<SignupScreenState> emit,
  ) async {
    // Show loading indicator
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      // Use the processed phone number instead of the controller text
      final phoneNumber =
          state.processedPhoneNumber ?? state.numberController!.text;

      // Use mock data instead of API call
      final response = UserMocks.mockRegisterResponse(
        state.nameController!.text,
        state.emailController!.text,
        phoneNumber,
        state.passwordController!.text,
      );

      // Handle the response
      if (response['success']) {
        // Registration successful
        emit(state.copyWith(isLoading: false, errorMessage: null));
      } else {
        // Registration failed
        emit(state.copyWith(
            isLoading: false, errorMessage: response['message']));
      }
    } catch (e) {
      // Handle any errors
      emit(state.copyWith(
          isLoading: false,
          errorMessage: 'An error occurred: ${e.toString()}'));
    }
  }
}
