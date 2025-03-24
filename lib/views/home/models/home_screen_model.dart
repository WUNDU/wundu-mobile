import 'package:equatable/equatable.dart';
import 'package:wundu/views/home/models/home_screen_item_model.dart';
import 'package:wundu/views/home/models/transaction_model.dart';

class HomeScreenModel extends Equatable {
  const HomeScreenModel({
    this.itemList = const [],
    this.transactions = const [],
  });

  final List<HomeScreenItemModel> itemList;
  final List<TransactionModel> transactions;

  HomeScreenModel copyWith({
    List<HomeScreenItemModel>? itemList,
    List<TransactionModel>? transactions,
  }) {
    return HomeScreenModel(
      itemList: itemList ?? this.itemList,
      transactions: transactions ?? this.transactions,
    );
  }

  @override
  List<Object?> get props => [itemList, transactions];
}
