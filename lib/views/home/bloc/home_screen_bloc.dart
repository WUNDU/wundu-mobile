import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/card/add_card_manual/utils/card_manager.dart';
import 'package:wundu/views/home/models/home_screen_item_model.dart';
import 'package:wundu/views/home/models/home_screen_model.dart';
import 'package:wundu/core/mocks/transaction_mocks.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final CardManager _cardManager = CardManager();
  StreamSubscription? _cardChangeSubscription;

  HomeScreenBloc(super.initialState) {
    on<HomeScreenInitialEvent>(_onInitialize);
    on<LoadMoreTransactionsEvent>(_onLoadMoreTransactions);
    on<ToggleBalanceVisibilityEvent>(_onToggleBalanceVisibility);

    // Escutar mudanças no CardManager
    _cardChangeSubscription = _cardManager.onCardChanged.listen((_) {
      add(HomeScreenInitialEvent()); // Re-inicializar quando houver mudanças
    });
  }

  Future<void> _onInitialize(
    HomeScreenInitialEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    if (_cardManager.hasCards) {
      final cards = _cardManager.cards;
      final firstCardId = _cardManager.getFirstCardId();
      final transactions = TransactionMocks.getMockTransactions(firstCardId);
      final totalBalance = cards.fold<double>(
          0, (sum, card) => sum + _cardManager.getBalance(card.cardNumber!));

      emit(state.copyWith(
        homeScreenModelObj: HomeScreenModel(
          itemList: transactions.map((transaction) {
            return HomeScreenItemModel(
              transactionType: transaction.title,
              ibanCounter: transaction.description,
              backgroundColor: transaction.backgroundColor,
              iconPath: transaction.iconPath,
            );
          }).toList(),
          transactions: transactions,
          cards: cards,
          totalBalance: totalBalance,
          isBalanceVisible: false,
          isLoading: false,
          hasMore: true,
        ),
      ));
    } else {
      emit(state.copyWith(
        homeScreenModelObj: HomeScreenModel(
          itemList: [],
          transactions: [],
          cards: [],
          totalBalance: 0.0,
          isBalanceVisible: false,
          isLoading: false,
          hasMore: false,
        ),
      ));
    }
  }

  _onLoadMoreTransactions(
    LoadMoreTransactionsEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    if (!_cardManager.hasCards ||
        (state.homeScreenModelObj?.isLoading ?? false)) {
      return;
    }

    emit(state.copyWith(
      homeScreenModelObj: state.homeScreenModelObj?.copyWith(isLoading: true),
    ));

    await Future.delayed(const Duration(seconds: 1));
    final currentTransactions = state.homeScreenModelObj?.transactions ?? [];
    emit(state.copyWith(
      homeScreenModelObj: state.homeScreenModelObj?.copyWith(
        transactions: currentTransactions,
        isLoading: false,
        hasMore: currentTransactions.length < 10,
      ),
    ));
  }

  _onToggleBalanceVisibility(
    ToggleBalanceVisibilityEvent event,
    Emitter<HomeScreenState> emit,
  ) {
    emit(state.copyWith(
      homeScreenModelObj: state.homeScreenModelObj?.copyWith(
        isBalanceVisible: !state.homeScreenModelObj!.isBalanceVisible,
      ),
    ));
  }

  @override
  Future<void> close() {
    _cardChangeSubscription?.cancel();
    return super.close();
  }
}
