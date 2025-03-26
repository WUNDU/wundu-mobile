import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/transaction_details_screen_model.dart';
part 'transaction_details_screen_event.dart';
part 'transaction_details_screen_state.dart';

/// A bloc that manages the state of a TransactionDetailsScreen according to events.
class TransactionDetailsScreenBloc
    extends Bloc<TransactionDetailsScreenEvent, TransactionDetailsScreenState> {
  TransactionDetailsScreenBloc(super.initialState) {
    on<TransactionDetailsScreenInitialEvent>(_onInitialize);
    on<ChangeTimeEvent>(_changeTime);
  }

  Future<void> _onInitialize(
    TransactionDetailsScreenInitialEvent event,
    Emitter<TransactionDetailsScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        dateEditController: TextEditingController(),
        timeEditController: TextEditingController(),
      ),
    );
  }

  void _changeTime(
    ChangeTimeEvent event,
    Emitter<TransactionDetailsScreenState> emit,
  ) {
    emit(
      state.copyWith(
        transactionDetailsScreenModelObj: state.transactionDetailsScreenModelObj
            ?.copyWith(selectedTimeEdit: event.time),
      ),
    );
  }
}
