part of 'splash_screen_bloc.dart';

// ignore: must_be_immutable
class SplashScreenState extends Equatable {
  SplashScreenState({required this.splashScreenModelObj});

  SplashScreenModel? splashScreenModelObj;

  @override
  List<Object?> get props => [splashScreenModelObj];
  SplashScreenState copyWith({SplashScreenModel? splashScreenModelObj}) {
    return SplashScreenState(
        splashScreenModelObj:
            splashScreenModelObj ?? this.splashScreenModelObj);
  }
}
