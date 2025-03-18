part of 'add_card_manual_bloc.dart';

class AddCardManualState extends Equatable {
  final AddCardManualModel addCardManualModelObj;
  final bool isLoading;
  final bool isSubmitted;
  final String? errorMessage;

  const AddCardManualState({
    required this.addCardManualModelObj,
    this.isLoading = false,
    this.isSubmitted = false,
    this.errorMessage,
  });

  AddCardManualState copyWith({
    AddCardManualModel? addCardManualModelObj,
    bool? isLoading,
    bool? isSubmitted,
    String? errorMessage,
  }) {
    return AddCardManualState(
      addCardManualModelObj:
          addCardManualModelObj ?? this.addCardManualModelObj,
      isLoading: isLoading ?? this.isLoading,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        addCardManualModelObj,
        isLoading,
        isSubmitted,
        errorMessage,
      ];
}
