part of 'add_category_bloc.dart';

/// Represents the state of AddCategory in the application.
// ignore: must_be_immutable
class AddCategoryState extends Equatable {
  AddCategoryState({
    this.descriptionController,
    this.addCategoryModelObj,
  });

  TextEditingController? descriptionController;
  AddCategoryModel? addCategoryModelObj;

  @override
  List<Object?> get props => [
        descriptionController,
        addCategoryModelObj,
      ];

  AddCategoryState copyWith({
    TextEditingController? descriptionController,
    AddCategoryModel? addCategoryModelObj,
  }) {
    return AddCategoryState(
      descriptionController:
          descriptionController ?? this.descriptionController,
      addCategoryModelObj: addCategoryModelObj ?? this.addCategoryModelObj,
    );
  }
}
