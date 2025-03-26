import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:wundu/views/home/models/transaction_model.dart';

// ignore: must_be_immutable
class TransactionDetailsScreenModel extends Equatable {
  TransactionDetailsScreenModel({
    this.selectedTimeEdit,
    this.timeEdit = "",
    this.transaction,
  }) {
    selectedTimeEdit = selectedTimeEdit ?? TimeOfDay.now();
  }

  TimeOfDay? selectedTimeEdit;
  String timeEdit;
  TransactionModel? transaction;

  TransactionDetailsScreenModel copyWith({
    TimeOfDay? selectedTimeEdit,
    String? timeEdit,
    TransactionModel? transaction,
  }) {
    return TransactionDetailsScreenModel(
      selectedTimeEdit: selectedTimeEdit ?? this.selectedTimeEdit,
      timeEdit: timeEdit ?? this.timeEdit,
      transaction: transaction ?? this.transaction,
    );
  }

  @override
  List<Object?> get props => [selectedTimeEdit, timeEdit, transaction];
}
