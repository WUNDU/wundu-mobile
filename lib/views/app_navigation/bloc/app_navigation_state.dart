part of 'app_navigation_bloc.dart';

// ignore: must_be_immutable
class AppNavigationState extends Equatable {
  AppNavigationState({this.appNavigationModelObj});

  AppNavigationModel? appNavigationModelObj;
  @override
  List<Object?> get props => [appNavigationModelObj];
  AppNavigationState copyWith({AppNavigationModel? appNavigationModelObj}) {
    return AppNavigationState(
        appNavigationModelObj:
            appNavigationModelObj ?? this.appNavigationModelObj);
  }
}
