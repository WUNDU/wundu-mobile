import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/mocks/card_mocks.dart';
import 'package:wundu/views/card/add_card_manual/models/add_card_manual_model.dart';
import 'package:wundu/views/card/add_card_manual/utils/card_manager.dart';

part 'add_card_manual_event.dart';
part 'add_card_manual_state.dart';

class AddCardManualBloc extends Bloc<AddCardManualEvent, AddCardManualState> {
  AddCardManualBloc(super.initialState) {
    on<AddCardManualInitialEvent>(_onInitialize);
    on<AddCardNumberChangedEvent>(_onCardNumberChanged);
    on<AddExpiryDateChangedEvent>(_onExpiryDateChanged);
    on<AddCardNameChangedEvent>(_onCardNameChanged);
    on<AddCardSubmitEvent>(_onSubmit);
  }

  void _onInitialize(
    AddCardManualInitialEvent event,
    Emitter<AddCardManualState> emit,
  ) {
    emit(state.copyWith(
      addCardManualModelObj: AddCardManualModel(),
      isLoading: false,
      isSubmitted: false,
      errorMessage: null,
    ));
  }

  void _onCardNumberChanged(
    AddCardNumberChangedEvent event,
    Emitter<AddCardManualState> emit,
  ) {
    final isValid = _validateCardNumber(event.cardNumber);
    emit(state.copyWith(
      addCardManualModelObj: state.addCardManualModelObj.copyWith(
        cardNumber: event.cardNumber,
        isValidCardNumber: isValid,
      ),
      // Não defina errorMessage aqui
    ));
  }

  void _onExpiryDateChanged(
    AddExpiryDateChangedEvent event,
    Emitter<AddCardManualState> emit,
  ) {
    final isValid = _validateExpiryDate(event.expiryDate);
    emit(state.copyWith(
      addCardManualModelObj: state.addCardManualModelObj.copyWith(
        expiryDate: event.expiryDate,
        isValidExpiryDate: isValid,
      ),
      // Não defina errorMessage aqui
    ));
  }

  void _onCardNameChanged(
    AddCardNameChangedEvent event,
    Emitter<AddCardManualState> emit,
  ) {
    final isValid = event.cardName.isNotEmpty;
    emit(state.copyWith(
      addCardManualModelObj: state.addCardManualModelObj.copyWith(
        cardName: event.cardName,
        isValidCardName: isValid,
      ),
      // Não defina errorMessage aqui
    ));
  }

  void _onSubmit(
    AddCardSubmitEvent event,
    Emitter<AddCardManualState> emit,
  ) async {
    // Validações iniciais
    final isCardNumberValid = _validateCardNumber(event.cardNumber);
    final isExpiryDateValid = _validateExpiryDate(event.expiryDate);
    final isCardNameValid = event.cardName.isNotEmpty;

    if (!isCardNumberValid || !isExpiryDateValid || !isCardNameValid) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Por favor, preencha todos os campos corretamente.",
        addCardManualModelObj: state.addCardManualModelObj.copyWith(
          isValidCardNumber: isCardNumberValid,
          isValidExpiryDate: isExpiryDateValid,
          isValidCardName: isCardNameValid,
        ),
      ));
      return;
    }

    // Verifica se o cartão está na lista de mocks
    final mockCards = CardMocks.getMockCards();
    final matchingCard = mockCards.firstWhere(
      (card) => card.cardNumber == event.cardNumber,
      orElse: () => AddCardManualModel(
        cardNumber: '',
        expiryDate: '',
        cardName: '',
      ),
    );

    if (matchingCard.cardNumber!.isEmpty) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Este cartão não é válido ou não está registrado.",
      ));
      return;
    }

    if (matchingCard.expiryDate != event.expiryDate) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage:
            "A data de expiração não corresponde ao cartão registrado.",
      ));
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      await Future.delayed(const Duration(seconds: 1));

      final card = AddCardManualModel(
        cardNumber: event.cardNumber,
        expiryDate: event.expiryDate,
        cardName: event.cardName,
        isValidCardNumber: true,
        isValidExpiryDate: true,
        isValidCardName: true,
      );

      if (!CardManager().cards.any((c) => c.cardNumber == card.cardNumber)) {
        CardManager().addCard(card);
        emit(state.copyWith(
          isLoading: false,
          isSubmitted: true,
          errorMessage: null,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: "Este cartão já foi adicionado.",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Ocorreu um erro ao adicionar o cartão.",
      ));
    }
  }

  bool _validateCardNumber(String cardNumber) {
    final cleanedNumber = cardNumber.replaceAll(RegExp(r'[\s-]'), '');
    if (cleanedNumber.length < 13 || cleanedNumber.length > 19) {
      return false;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(cleanedNumber)) {
      return false;
    }
    int sum = 0;
    bool alternate = false;
    for (int i = cleanedNumber.length - 1; i >= 0; i--) {
      int n = int.parse(cleanedNumber[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) {
          n = (n % 10) + 1;
        }
      }
      sum += n;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }

  bool _validateExpiryDate(String expiryDate) {
    if (!RegExp(r'^(0[1-9]|1[0-2])\/([0-9]{2})$').hasMatch(expiryDate)) {
      return false;
    }
    final parts = expiryDate.split('/');
    final month = int.parse(parts[0]);
    final year = int.parse('20${parts[1]}');
    final now = DateTime.now();
    final currentYear = now.year;
    final currentMonth = now.month;
    if (year < currentYear) {
      return false;
    }
    if (year == currentYear && month < currentMonth) {
      return false;
    }
    return true;
  }
}
