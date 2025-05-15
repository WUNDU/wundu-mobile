part of 'signup_screen_bloc.dart';

abstract class SignupScreenEvent {}

class SignupScreenInitialEvent extends SignupScreenEvent {}

class ChangeStepEvent extends SignupScreenEvent {
  final int step;
  ChangeStepEvent({required this.step});
}

class PreparePhoneNumberEvent extends SignupScreenEvent {
  final String phoneNumber;
  PreparePhoneNumberEvent({required this.phoneNumber});
}

class CompleteRegistrationEvent extends SignupScreenEvent {}
