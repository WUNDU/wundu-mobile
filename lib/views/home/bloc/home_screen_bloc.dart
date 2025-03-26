// home_screen_bloc.dart
import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/mocks/category_mocks.dart';
import 'package:wundu/views/home/models/home_screen_model.dart';
import 'package:wundu/views/home/models/home_screen_item_model.dart';
import 'package:wundu/views/home/models/transaction_model.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc(super.initialState) {
    on<HomeScreenInitialEvent>(_onInitialize);
    on<LoadMoreTransactionsEvent>(_onLoadMoreTransactions);
  }

  _onInitialize(
    HomeScreenInitialEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    bool hasAccounts = true;

    if (hasAccounts) {
      // Carrega as transações mockadas
      List<TransactionModel> transactions =
          TransactionMocks.getMockTransactions();

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
    }
  }

  _onLoadMoreTransactions(
    LoadMoreTransactionsEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    if (state.homeScreenModelObj?.isLoading ?? false) return;

    emit(state.copyWith(
      homeScreenModelObj: state.homeScreenModelObj?.copyWith(
        isLoading: true,
      ),
    ));

    // Simula um delay de carregamento
    await Future.delayed(const Duration(seconds: 1));

    // Adiciona mais transações mockadas
    final newTransactions = [
      TransactionModel(
        id: "6",
        title: "Transferência Recebida",
        description: "IBAN 00987654321",
        amount: 300.0,
        date: DateTime.now().subtract(const Duration(days: 5)),
        type: "transfer",
        backgroundColor: appTheme.teal300,
        iconPath: ImageConstant.arrowUp,
      ),
      TransactionModel(
        id: "7",
        title: "Pagamento de Serviço",
        description: "Fatura 12345678",
        amount: 85.0,
        date: DateTime.now().subtract(const Duration(days: 6)),
        type: "payment",
        backgroundColor: appTheme.deepOrangeA40019,
        iconPath: ImageConstant.arrowDown,
      ),
    ];

    final currentTransactions = state.homeScreenModelObj?.transactions ?? [];
    final allTransactions = [...currentTransactions, ...newTransactions];

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
        hasMore: allTransactions.length <
            10, // Limite de 10 transações para o exemplo
      ),
    ));
  }
}
