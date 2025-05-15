import 'package:equatable/equatable.dart';
import 'notification_item_model.dart';

/// and is typically used to hold data that is passed between different parts
// ignore_for_file: must_be_immutable
class NotificationModel extends Equatable {
  const NotificationModel({this.notificationItemList = const []});

  final List<NotificationItemModel> notificationItemList;

  @override
  List<Object?> get props => [notificationItemList];

  NotificationModel copyWith({
    List<NotificationItemModel>? notificationItemList,
  }) {
    return NotificationModel(
      notificationItemList: notificationItemList ?? this.notificationItemList,
    );
  }
}
