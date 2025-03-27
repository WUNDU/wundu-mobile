part of 'add_category_bloc.dart';

class AddCategoryState extends Equatable {
  final AddCategoryModel? addCategoryModelObj;
  final TextEditingController? descriptionController;
  final bool isCategorySelected; // Controla se uma categoria foi selecionada
  final bool isDescriptionFilled; // Controla se a descrição foi preenchida

  const AddCategoryState({
    this.addCategoryModelObj,
    this.descriptionController,
    this.isCategorySelected = false,
    this.isDescriptionFilled = false,
  });

  @override
  List<Object?> get props => [
        addCategoryModelObj,
        descriptionController,
        isCategorySelected,
        isDescriptionFilled,
      ];

  AddCategoryState copyWith({
    AddCategoryModel? addCategoryModelObj,
    TextEditingController? descriptionController,
    bool? isCategorySelected,
    bool? isDescriptionFilled,
  }) {
    return AddCategoryState(
      addCategoryModelObj: addCategoryModelObj ?? this.addCategoryModelObj,
      descriptionController:
          descriptionController ?? this.descriptionController,
      isCategorySelected: isCategorySelected ?? this.isCategorySelected,
      isDescriptionFilled: isDescriptionFilled ?? this.isDescriptionFilled,
    );
  }
}