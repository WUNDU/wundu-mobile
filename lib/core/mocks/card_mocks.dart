import 'package:wundu/views/card/add_card_manual/models/add_card_manual_model.dart';

class CardMocks {
  static List<AddCardManualModel> getMockCards() {
    return [
      AddCardManualModel(
        cardNumber: "5002940260147404",
        expiryDate: "12/26",
        cardName: "João Silva",
        isValidCardNumber: true,
        isValidExpiryDate: true,
        isValidCardName: true,
      ),
      AddCardManualModel(
        cardNumber: "9876543210987654",
        expiryDate: "06/27",
        cardName: "Maria Oliveira",
        isValidCardNumber: true,
        isValidExpiryDate: true,
        isValidCardName: true,
      ),
    ];
  }

  static double getMockBalance(String cardNumber) {
    // Saldo mockado para cada cartão
    final balances = {
      "5002940260147404": 14500.75,
      "9876543210987654": 11300.50,
    };
    return balances[cardNumber] ?? 0.0;
  }
}
