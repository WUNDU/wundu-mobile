import 'package:wundu/views/card/add_card_manual/models/add_card_manual_model.dart';

class CardManager {
  static final CardManager _instance = CardManager._internal();
  factory CardManager() => _instance;
  CardManager._internal();

  final List<AddCardManualModel> _cards = [];

  List<AddCardManualModel> get cards => _cards;

  void addCard(AddCardManualModel card) {
    _cards.add(card);
  }

  bool get hasCards => _cards.isNotEmpty;

  String? getFirstCardId() =>
      _cards.isNotEmpty ? _cards.first.cardNumber : null;
}
