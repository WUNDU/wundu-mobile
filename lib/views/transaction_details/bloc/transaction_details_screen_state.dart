part of 'transaction_details_screen_bloc.dart';

/// Represents the state of TransactionDetailsScreen in the application.

// ignore_for_file: must_be_immutable
class TransactionDetailsScreenState extends Equatable {
  TransactionDetailsScreenState({
    this.dateEditController,
    this.timeEditController,
    this.selectedDatesFromCalendar,
    this.transactionDetailsScreenModelObj,
  });

  TextEditingController? dateEditController;
  TextEditingController? timeEditController;
  TransactionDetailsScreenModel? transactionDetailsScreenModelObj;
  DateTime? selectedDatesFromCalendar;

  @override
  List<Object?> get props => [
        dateEditController,
        timeEditController,
        selectedDatesFromCalendar,
        transactionDetailsScreenModelObj,
      ];

  TransactionDetailsScreenState copyWith({
    TextEditingController? dateEditController,
    TextEditingController? timeEditController,
    DateTime? selectedDatesFromCalendar,
    TransactionDetailsScreenModel? transactionDetailsScreenModelObj,
  }) {
    return TransactionDetailsScreenState(
      dateEditController: dateEditController ?? this.dateEditController,
      timeEditController: timeEditController ?? this.timeEditController,
      selectedDatesFromCalendar:
          selectedDatesFromCalendar ?? this.selectedDatesFromCalendar,
      transactionDetailsScreenModelObj: transactionDetailsScreenModelObj ??
          this.transactionDetailsScreenModelObj,
    );
  }
}
