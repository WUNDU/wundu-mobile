part of 'signup_screen_bloc.dart';

abstract class SignupScreenEvent {}

class SignupScreenInitialEvent extends SignupScreenEvent {}

class ChangeStepEvent extends SignupScreenEvent {
  final int step;
  ChangeStepEvent({required this.step});
}

class CompleteRegistrationEvent extends SignupScreenEvent {}
