import 'package:wundu/core/app_export.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/transaction_details/models/transaction_model.dart';

class TransactionMocks {
  static List<TransactionModel> getMockTransactions(String? cardId) {
    if (cardId == null) return [];

    return [
      TransactionModel(
        id: "1-$cardId",
        title: "Transferência para Cliente",
        description: "IBAN 0045678909876",
        amount: 150.0,
        date: DateTime.now(),
        type: "transfer",
        category: "Transporte", // Adicionada categoria
        backgroundColor: appTheme.yellow100,
        iconPath: ImageConstant.transfer,
        buttonStyle: CustomButtonStyles.fillTeal,
        cardId: cardId,
      ),
      TransactionModel(
        id: "2-$cardId",
        title: "Pagamento de Serviço",
        description: "Fatura 87654321",
        amount: 75.5,
        date: DateTime.now().subtract(const Duration(days: 1)),
        type: "payment",
        category: "Saúde", // Adicionada categoria
        backgroundColor: appTheme.deepOrangeA40019,
        iconPath: ImageConstant.arrowDown,
        buttonStyle: CustomButtonStyles.fillDeepOrange,
        cardId: cardId,
      ),
      TransactionModel(
        id: "3-$cardId",
        title: "Levantamento",
        description: "Terminal 12345",
        amount: 200.0,
        date: DateTime.now().subtract(const Duration(days: 2)),
        type: "withdrawal",
        category: "Lazer", // Adicionada categoria
        backgroundColor: appTheme.deepOrangeA40019,
        iconPath: ImageConstant.arrowDown,
        buttonStyle: CustomButtonStyles.fillDeepOrange,
        cardId: cardId,
      ),
      TransactionModel(
        id: "4-$cardId",
        title: "Depósito",
        description: "Agência 5678",
        amount: 500.0,
        date: DateTime.now().subtract(const Duration(days: 3)),
        type: "deposit",
        category: null, // Depósitos podem não ter categoria
        backgroundColor: appTheme.tealA2004c,
        iconPath: ImageConstant.arrowUp,
        buttonStyle: CustomButtonStyles.fillTeal,
        cardId: cardId,
      ),
    ];
  }
}
