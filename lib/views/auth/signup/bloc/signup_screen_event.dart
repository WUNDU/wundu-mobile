part of 'signup_screen_bloc.dart';

@immutable
abstract class SignupScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupScreenInitialEvent extends SignupScreenEvent {}

class ChangeStepEvent extends SignupScreenEvent {
  final int step;

  ChangeStepEvent({required this.step});

  @override
  List<Object?> get props => [step];
}

class CompleteRegistrationEvent extends SignupScreenEvent {}

class ClearPasswordFieldsEvent extends SignupScreenEvent {}
