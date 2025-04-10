part of 'notification_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// Notification widget.
///
/// Events must be immutable and implement the [Equatable] interface.
abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Notification widget is first created.
class NotificationInitialEvent extends NotificationEvent {
  const NotificationInitialEvent();

  @override
  List<Object?> get props => [];
}
