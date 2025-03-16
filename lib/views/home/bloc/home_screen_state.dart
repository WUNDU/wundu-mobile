part of 'home_screen_bloc.dart';
// ignore: must_be_immutable
class HomeScreenState extends Equatable {
  HomeScreenState({this.homeScreenModelObj});

  HomeScreenModel? homeScreenModelObj;

  @override
  List<Object?> get props => [homeScreenModelObj];
  HomeScreenState copyWith({HomeScreenModel? homeScreenModelObj}) {
    return HomeScreenState(
        homeScreenModelObj: homeScreenModelObj ?? this.homeScreenModelObj);
  }
}
