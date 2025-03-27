import 'package:wundu/core/mocks/card_mocks.dart';
import 'package:wundu/views/card/add_card_manual/models/add_card_manual_model.dart';
import 'package:wundu/views/transaction_details/models/transaction_model.dart';
import 'package:wundu/core/mocks/transaction_mocks.dart';

class CardManager {
  static final CardManager _instance = CardManager._internal();
  factory CardManager() => _instance;
  CardManager._internal();

  final List<AddCardManualModel> _cards = [];
  final Map<String, double> _balances = {}; // Saldo por cartão
  final Map<String, List<TransactionModel>> _cardTransactions =
      {}; // Transações por cartão

  List<AddCardManualModel> get cards => _cards;
  int get cardCount => _cards.length;

  void addCard(AddCardManualModel card) {
    if (!_cards.any((c) => c.cardNumber == card.cardNumber)) {
      _cards.add(card);
      // Corrigir a chamada para usar card.cardNumber
      _balances[card.cardNumber!] = CardMocks.getMockBalance(card.cardNumber!);
      // Associa transações mockadas ao cartão
      _cardTransactions[card.cardNumber!] =
          TransactionMocks.getMockTransactions(card.cardNumber);
      _updateBalance(card.cardNumber!);
    }
  }

  double getBalance(String cardId) => _balances[cardId] ?? 0.0;

  List<TransactionModel> getTransactions(String cardId) =>
      _cardTransactions[cardId] ?? [];

  bool get hasCards => _cards.isNotEmpty;

  String? getFirstCardId() =>
      _cards.isNotEmpty ? _cards.first.cardNumber : null;

  void _updateBalance(String cardId) {
    final transactions = _cardTransactions[cardId] ?? [];
    double balance = _balances[cardId] ?? 0.0;
    for (var transaction in transactions) {
      if (transaction.type == "deposit") {
        balance += transaction.amount;
      } else if (transaction.type == "payment" ||
          transaction.type == "withdrawal" ||
          transaction.type == "transfer") {
        balance -= transaction.amount;
      }
    }
    _balances[cardId] = balance;
  }
}
