import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/card/add_card_manual/models/add_card_manual_model.dart';

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
    ));
  }

  void _onSubmit(
    AddCardSubmitEvent event,
    Emitter<AddCardManualState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    // Valide os dados
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

    try {
      // Simule uma chamada de API ou serviço
      await Future.delayed(Duration(seconds: 1));

      // Se tudo estiver ok, marque como enviado
      emit(state.copyWith(
        isLoading: false,
        isSubmitted: true,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Ocorreu um erro ao adicionar o cartão.",
      ));
    }
  }

  bool _validateCardNumber(String cardNumber) {
    // Remove espaços e traços
    final cleanedNumber = cardNumber.replaceAll(RegExp(r'[\s-]'), '');

    // Deve ter entre 13 e 19 dígitos
    if (cleanedNumber.length < 13 || cleanedNumber.length > 19) {
      return false;
    }

    // Deve conter apenas dígitos
    if (!RegExp(r'^[0-9]+$').hasMatch(cleanedNumber)) {
      return false;
    }

    // Algoritmo de Luhn (verificação de dígito)
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
    // Formato esperado: MM/AA
    if (!RegExp(r'^(0[1-9]|1[0-2])\/([0-9]{2})$').hasMatch(expiryDate)) {
      return false;
    }

    // Extrai mês e ano
    final parts = expiryDate.split('/');
    final month = int.parse(parts[0]);
    final year = int.parse('20${parts[1]}');

    // Verificar se a data não está expirada
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
