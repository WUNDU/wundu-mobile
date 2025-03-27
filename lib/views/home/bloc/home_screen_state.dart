part of 'home_screen_bloc.dart';

// ignore: must_be_immutable
class HomeScreenState extends Equatable {
  HomeScreenState(
      {this.homeScreenModelObj,
      this.selectedDatesFromCalendar,
      this.selectedDatesFromCalendar1,
      this.selectedDatesFromCalendar2});

  HomeScreenModel? homeScreenModelObj;
  DateTime? selectedDatesFromCalendar;
  DateTime? selectedDatesFromCalendar1;
  DateTime? selectedDatesFromCalendar2;

  @override
  List<Object?> get props => [
        homeScreenModelObj,
        selectedDatesFromCalendar,
        selectedDatesFromCalendar1,
        selectedDatesFromCalendar2
      ];
  HomeScreenState copyWith(
      {HomeScreenModel? homeScreenModelObj,
      DateTime? selectedDatesFromCalendar,
      DateTime? selectedDatesFromCalendar1,
      DateTime? selectedDatesFromCalendar2}) {
    return HomeScreenState(
        homeScreenModelObj: homeScreenModelObj ?? this.homeScreenModelObj,
        selectedDatesFromCalendar:
            selectedDatesFromCalendar ?? this.selectedDatesFromCalendar,
        selectedDatesFromCalendar1:
            selectedDatesFromCalendar1 ?? this.selectedDatesFromCalendar1,
        selectedDatesFromCalendar2:
            selectedDatesFromCalendar2 ?? this.selectedDatesFromCalendar2);
  }
}
