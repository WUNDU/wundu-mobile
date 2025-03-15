import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wundu/views/onboardingScreen/models/onboarding_screen_model.dart';

part 'onboarding_screen_state.dart';
part 'onboarding_screen_event.dart';

class OnboardingScreenBloc
    extends Bloc<OnboardingScreenEvent, OnboardingScreenState> {
  OnboardingScreenBloc(super.initialState) {
    on<OnboardingScreenInitiaEvent>(_onInitialize);
  }

  _onInitialize(
    OnboardingScreenInitiaEvent event,
    Emitter<OnboardingScreenState> emit,
  ) {}
}
