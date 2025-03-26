// home_screen_model.dart
import 'package:equatable/equatable.dart';
import 'package:wundu/views/home/models/home_screen_item_model.dart';
import 'package:wundu/views/home/models/transaction_model.dart';

class HomeScreenModel extends Equatable {
  const HomeScreenModel({
    this.itemList = const [],
    this.transactions = const [],
    this.isLoading = false,
    this.hasMore = true,
  });

  final List<HomeScreenItemModel> itemList;
  final List<TransactionModel> transactions;
  final bool isLoading;
  final bool hasMore;

  @override
  List<Object?> get props => [
        itemList,
        transactions,
        isLoading,
        hasMore,
      ];

  HomeScreenModel copyWith({
    List<HomeScreenItemModel>? itemList,
    List<TransactionModel>? transactions,
    bool? isLoading,
    bool? hasMore,
  }) {
    return HomeScreenModel(
      itemList: itemList ?? this.itemList,
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
