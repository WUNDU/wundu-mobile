part of 'add_category_bloc.dart';

abstract class AddCategoryEvent extends Equatable {
  const AddCategoryEvent();

  @override
  List<Object?> get props => [];
}

class AddCategoryInitialEvent extends AddCategoryEvent {}

class UpdateChipViewEvent extends AddCategoryEvent {
  final int index;
  final bool? isSelected;

  const UpdateChipViewEvent({required this.index, this.isSelected});

  @override
  List<Object?> get props => [index, isSelected];
}

class UpdateDescriptionEvent extends AddCategoryEvent {
  final String description;

  const UpdateDescriptionEvent(this.description);

  @override
  List<Object?> get props => [description];
}

class SaveCategoryEvent extends AddCategoryEvent {
  final Function(String?) onCategorySaved;

  const SaveCategoryEvent(this.onCategorySaved);

  @override
  List<Object?> get props => [onCategorySaved];
}
