import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/card/add_card_manual/utils/card_manager.dart';
import 'package:wundu/views/home/models/home_screen_model.dart';
import 'package:wundu/views/home/models/home_screen_item_model.dart';
import 'package:wundu/views/transaction_details/models/transaction_model.dart';
import 'package:wundu/core/mocks/transaction_mocks.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final CardManager _cardManager = CardManager();

  HomeScreenBloc(super.initialState) {
    on<HomeScreenInitialEvent>(_onInitialize);
    on<LoadMoreTransactionsEvent>(_onLoadMoreTransactions);
  }

  _onInitialize(
    HomeScreenInitialEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    if (_cardManager.hasCards) {
      // Carrega as transações mockadas associadas ao primeiro cartão
      List<TransactionModel> transactions =
          TransactionMocks.getMockTransactions(_cardManager.getFirstCardId());

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
          isLoading: false,
          hasMore: true,
        ),
      ));
    } else {
      // Sem cartões, inicializa com lista vazia
      emit(state.copyWith(
        homeScreenModelObj: HomeScreenModel(
          itemList: [],
          transactions: [],
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
        (state.homeScreenModelObj?.isLoading ?? false)) return;

    emit(state.copyWith(
      homeScreenModelObj: state.homeScreenModelObj?.copyWith(
        isLoading: true,
      ),
    ));

    await Future.delayed(const Duration(seconds: 1));

    final currentTransactions = state.homeScreenModelObj?.transactions ?? [];
    final allTransactions = [...currentTransactions];

    emit(state.copyWith(
      homeScreenModelObj: HomeScreenModel(
        itemList: allTransactions.map((transaction) {
          return HomeScreenItemModel(
            transactionType: transaction.title,
            ibanCounter: transaction.description,
            backgroundColor: transaction.backgroundColor,
            iconPath: transaction.iconPath,
          );
        }).toList(),
        transactions: allTransactions,
        isLoading: false,
        hasMore: allTransactions.length < 10,
      ),
    ));
  }
}
