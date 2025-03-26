part of 'transaction_details_screen_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// TransactionDetailsScreen widget.

/// Events must be immutable and implement the [Equatable] interface.
abstract class TransactionDetailsScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the TransactionDetailsScreen widget is initialized.
class TransactionDetailsScreenInitialEvent
    extends TransactionDetailsScreenEvent {
  @override
  List<Object?> get props => [];
}

/// Event for changing time.
// ignore_for_file: must_be_immutable
class ChangeTimeEvent extends TransactionDetailsScreenEvent {
  ChangeTimeEvent({required this.time});

  TimeOfDay time;

  @override
  List<Object?> get props => [time];
}
