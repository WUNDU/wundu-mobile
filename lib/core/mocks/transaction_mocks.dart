import 'package:wundu/core/app_export.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/transaction_details/models/transaction_model.dart';

class TransactionMocks {
  static List<TransactionModel> getMockTransactions(String? cardId) {
    if (cardId == null) return []; // Retorna vazio se não houver cartão
    return [
      TransactionModel(
        id: "1",
        title: "Transferência para Cliente",
        description: "IBAN 0045678909876",
        amount: 150.0,
        date: DateTime.now(),
        type: "transfer",
        backgroundColor: appTheme.yellow100,
        iconPath: ImageConstant.transfer,
        buttonStyle: CustomButtonStyles.fillTeal,
        cardId: cardId,
      ),
      TransactionModel(
        id: "2",
        title: "Pagamento de Serviço",
        description: "Fatura 87654321",
        amount: 75.5,
        date: DateTime.now().subtract(const Duration(days: 1)),
        type: "payment",
        backgroundColor: appTheme.deepOrangeA40019,
        iconPath: ImageConstant.arrowDown,
        buttonStyle: CustomButtonStyles.fillDeepOrange,
        cardId: cardId,
      ),
      TransactionModel(
        id: "3",
        title: "Levantamento",
        description: "Terminal 12345",
        amount: 200.0,
        date: DateTime.now().subtract(const Duration(days: 2)),
        type: "withdrawal",
        backgroundColor: appTheme.deepOrangeA40019,
        iconPath: ImageConstant.arrowDown,
        buttonStyle: CustomButtonStyles.fillDeepOrange,
        cardId: cardId,
      ),
      TransactionModel(
        id: "4",
        title: "Depósito",
        description: "Agência 5678",
        amount: 500.0,
        date: DateTime.now().subtract(const Duration(days: 3)),
        type: "deposit",
        backgroundColor: appTheme.tealA2004c,
        iconPath: ImageConstant.arrowUp,
        buttonStyle: CustomButtonStyles.fillTeal,
        cardId: cardId,
      ),
      TransactionModel(
        id: "5",
        title: "Pagamento de Fatura",
        description: "Cartão 4321",
        amount: 120.0,
        date: DateTime.now().subtract(const Duration(days: 4)),
        type: "payment",
        backgroundColor: appTheme.deepOrangeA40019,
        iconPath: ImageConstant.arrowDown,
        buttonStyle: CustomButtonStyles.fillDeepOrange,
        cardId: cardId,
      ),
    ];
  }
}
