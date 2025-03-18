part of 'add_card_manual_bloc.dart';

abstract class AddCardManualEvent extends Equatable {
  const AddCardManualEvent();

  @override
  List<Object?> get props => [];
}

class AddCardManualInitialEvent extends AddCardManualEvent {}

class AddCardNumberChangedEvent extends AddCardManualEvent {
  final String cardNumber;

  const AddCardNumberChangedEvent(this.cardNumber);

  @override
  List<Object?> get props => [cardNumber];
}

class AddExpiryDateChangedEvent extends AddCardManualEvent {
  final String expiryDate;

  const AddExpiryDateChangedEvent(this.expiryDate);

  @override
  List<Object?> get props => [expiryDate];
}

class AddCardNameChangedEvent extends AddCardManualEvent {
  final String cardName;

  const AddCardNameChangedEvent(this.cardName);

  @override
  List<Object?> get props => [cardName];
}

class AddCardSubmitEvent extends AddCardManualEvent {
  final String cardNumber;
  final String expiryDate;
  final String cardName;

  const AddCardSubmitEvent({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardName,
  });

  @override
  List<Object?> get props => [cardNumber, expiryDate, cardName];
}
