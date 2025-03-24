import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/home/models/home_screen_model.dart';
import 'package:wundu/views/home/models/home_screen_item_model.dart';
import 'package:wundu/views/home/models/transaction_model.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc(super.initialState) {
    on<HomeScreenInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomeScreenInitialEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    bool hasAccounts = true;

    if (hasAccounts) {
      // Crie uma lista de TransactionModel
      List<TransactionModel> transactions = [
        TransactionModel(
          id: "1",
          title: "Transferência para Cliente",
          description: "IBAN 0045678909876",
          amount: 150.0,
          date: DateTime.now(),
          type: "transfer",
          backgroundColor: appTheme.yellow100,
          iconPath: ImageConstant.transfer,
        ),
        TransactionModel(
          id: "2",
          title: "Pagamento de Serviço",
          description: "Fatura 87654321",
          amount: 75.5,
          date: DateTime.now().subtract(Duration(days: 1)),
          type: "payment",
          backgroundColor: appTheme.deepOrangeA40019,
          iconPath: ImageConstant.arrowDown,
        ),
        TransactionModel(
          id: "3",
          title: "Levantamento",
          description: "Terminal 12345",
          amount: 200.0,
          date: DateTime.now().subtract(Duration(days: 2)),
          type: "withdrawal",
          backgroundColor: appTheme.deepOrangeA40019,
          iconPath: ImageConstant.arrowDown,
        ),
      ];

      // Converta para HomeScreenItemModel
      List<HomeScreenItemModel> itemList = transactions.map((transaction) {
        return HomeScreenItemModel(
          transactionType: transaction.title,
          ibanCounter: transaction.description,
          backgroundColor: transaction.backgroundColor,
        );
      }).toList();

      emit(state.copyWith(
        homeScreenModelObj: HomeScreenModel(
          itemList: itemList,
          transactions:
              transactions, // Opcional: armazene também os modelos completos
        ),
      ));
    }
    // else {
    //   emit(state.copyWith(
    //     homeScreenModelObj: HomeScreenModel(
    //       itemList: [],
    //       transactions: [],
    //     ),
    //   ));
    // }
  }
}
