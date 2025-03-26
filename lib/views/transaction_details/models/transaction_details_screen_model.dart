import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [transaction_details_screen]
/// and is typically used to hold data that is passed between different parts.

// ignore_for_file: must_be_immutable
class TransactionDetailsScreenModel extends Equatable {
  TransactionDetailsScreenModel({
    this.selectedTimeEdit,
    this.timeEdit = "",
  }) {
    selectedTimeEdit = selectedTimeEdit ?? TimeOfDay.now();
  }

  TimeOfDay? selectedTimeEdit;
  String timeEdit;

  TransactionDetailsScreenModel copyWith({
    TimeOfDay? selectedTimeEdit,
    String? timeEdit,
  }) {
    return TransactionDetailsScreenModel(
      selectedTimeEdit: selectedTimeEdit ?? this.selectedTimeEdit,
      timeEdit: timeEdit ?? this.timeEdit,
    );
  }

  @override
  List<Object?> get props => [selectedTimeEdit, timeEdit];
}
