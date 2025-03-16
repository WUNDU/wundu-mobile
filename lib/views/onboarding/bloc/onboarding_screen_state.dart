part of 'onboarding_screen_bloc.dart';

// ignore: must_be_immutable
class OnboardingScreenState extends Equatable {
  OnboardingScreenState({required this.onboardingScreenModelObj});

  OnboardingScreenModel? onboardingScreenModelObj;
  @override
  List<Object?> get props => [onboardingScreenModelObj];
  OnboardingScreenState copyWith(
      {OnboardingScreenModel? onboardingScreenModelObj}) {
    return OnboardingScreenState(
        onboardingScreenModelObj:
            onboardingScreenModelObj ?? this.onboardingScreenModelObj);
  }
}
