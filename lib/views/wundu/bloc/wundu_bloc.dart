// wundu_bloc.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wundu/core/mocks/transaction_mocks.dart';
import 'package:wundu/views/transaction_details/models/transaction_model.dart';
import 'package:wundu/views/wundu/models/wundu_model.dart';
part 'wundu_event.dart';
part 'wundu_state.dart';

class WunduBloc extends Bloc<WunduEvent, WunduState> {
  WunduBloc(WunduState initialState) : super(initialState) {
    on<WunduInitialEvent>(_onInitialEvent);
  }

  void _onInitialEvent(WunduInitialEvent event, Emitter<WunduState> emit) {
    final transactions = TransactionMocks.getMockTransactions("5002940260147404");
    final categorizedTransactions = transactions.where((t) => t.category != null).toList();
    final categoryTotals = _calculateCategoryTotals(categorizedTransactions);

    emit(WunduState(wunduModelObj: WunduModel(categoryTotals: categoryTotals)));
  }

  Map<String, double> _calculateCategoryTotals(List<TransactionModel> transactions) {
    final Map<String, double> totals = {};
    for (var transaction in transactions) {
      if (transaction.category != null) {
        totals[transaction.category!] = (totals[transaction.category!] ?? 0) + transaction.amount;
      }
    }
    return totals;
  }
}