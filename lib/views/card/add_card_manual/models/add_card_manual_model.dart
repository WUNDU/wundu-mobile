import 'package:equatable/equatable.dart';

class AddCardManualModel extends Equatable {
  final String? cardNumber;
  final String? expiryDate;
  final String? cardName;
  final bool isValidCardNumber;
  final bool isValidExpiryDate;
  final bool isValidCardName;

  const AddCardManualModel({
    this.cardNumber = '',
    this.expiryDate = '',
    this.cardName = '',
    this.isValidCardNumber = false,
    this.isValidExpiryDate = false,
    this.isValidCardName = false,
  });

  AddCardManualModel copyWith({
    String? cardNumber,
    String? expiryDate,
    String? cardName,
    bool? isValidCardNumber,
    bool? isValidExpiryDate,
    bool? isValidCardName,
  }) {
    return AddCardManualModel(
      cardNumber: cardNumber ?? this.cardNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      cardName: cardName ?? this.cardName,
      isValidCardNumber: isValidCardNumber ?? this.isValidCardNumber,
      isValidExpiryDate: isValidExpiryDate ?? this.isValidExpiryDate,
      isValidCardName: isValidCardName ?? this.isValidCardName,
    );
  }

  @override
  List<Object?> get props => [
        cardNumber,
        expiryDate,
        cardName,
        isValidCardNumber,
        isValidExpiryDate,
        isValidCardName,
      ];
}
