part of 'add_category_bloc.dart';

/// Abstract class for all events that can be dispatched from the
/// AddCategory widget.

/// Events must be immutable and implement the [Equatable] interface.
abstract class AddCategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the AddCategory widget is initialized.
class AddCategoryInitialEvent extends AddCategoryEvent {
  @override
  List<Object?> get props => [];
}

/// Event for changing ChipView selection.
// ignore_for_file: must_be_immutable
class UpdateChipViewEvent extends AddCategoryEvent {
  UpdateChipViewEvent({required this.index, this.isSelected});

  final int index;
  final bool? isSelected;

  @override
  List<Object?> get props => [index, isSelected];
}
