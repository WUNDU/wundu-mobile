import 'package:equatable/equatable.dart';
import 'package:wundu/views/card/add_card_manual/models/add_card_manual_model.dart';
import 'package:wundu/views/home/models/home_screen_item_model.dart';
import 'package:wundu/views/transaction_details/models/transaction_model.dart';

class HomeScreenModel extends Equatable {
  const HomeScreenModel({
    this.itemList = const [],
    this.transactions = const [],
    this.cards = const [],
    this.totalBalance = 0.0,
    this.isBalanceVisible = false,
    this.isLoading = false,
    this.hasMore = true,
  });

  final List<HomeScreenItemModel> itemList;
  final List<TransactionModel> transactions;
  final List<AddCardManualModel> cards;
  final double totalBalance;
  final bool isBalanceVisible;
  final bool isLoading;
  final bool hasMore;

  @override
  List<Object?> get props => [
        itemList,
        transactions,
        cards,
        totalBalance,
        isBalanceVisible,
        isLoading,
        hasMore,
      ];

  HomeScreenModel copyWith({
    List<HomeScreenItemModel>? itemList,
    List<TransactionModel>? transactions,
    List<AddCardManualModel>? cards,
    double? totalBalance,
    bool? isBalanceVisible,
    bool? isLoading,
    bool? hasMore,
  }) {
    return HomeScreenModel(
      itemList: itemList ?? this.itemList,
      transactions: transactions ?? this.transactions,
      cards: cards ?? this.cards,
      totalBalance: totalBalance ?? this.totalBalance,
      isBalanceVisible: isBalanceVisible ?? this.isBalanceVisible,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
