part of 'card_screen_bloc.dart';

// ignore: must_be_immutable
class CardScreenState extends Equatable {
  CardScreenState({this.cardScreenModelObj});
  CardScreenModel? cardScreenModelObj;

  @override
  List<Object?> get props => [cardScreenModelObj];

  CardScreenState copyWith({CardScreenModel? cardScreenModelObj}) {
    return CardScreenState(
        cardScreenModelObj: cardScreenModelObj ?? this.cardScreenModelObj);
  }
}
