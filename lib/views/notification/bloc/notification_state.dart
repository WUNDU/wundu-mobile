part of 'notification_bloc.dart';

/// Represents the state of Notification in the application.

// ignore_for_file: must_be_immutable
class NotificationState extends Equatable {
   NotificationState({this.notificationModelObj});

  NotificationModel? notificationModelObj;

  @override
  List<Object?> get props => [notificationModelObj];

  NotificationState copyWith({NotificationModel? notificationModelObj}) {
    return NotificationState(
      notificationModelObj: notificationModelObj ?? this.notificationModelObj,
    );
  }
}
