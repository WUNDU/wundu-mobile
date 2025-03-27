import 'package:equatable/equatable.dart';

/// This class is used in the [view_category_item_widget] screen.

// ignore_for_file: must_be_immutable
class ViewCategoryItemModel extends Equatable {
  ViewCategoryItemModel({this.transporteOne, this.isSelected}) {
    transporteOne = transporteOne ?? "transporte";
    isSelected = isSelected ?? false;
  }

  String? transporteOne;
  bool? isSelected;

  ViewCategoryItemModel copyWith({
    String? transporteOne,
    bool? isSelected,
  }) {
    return ViewCategoryItemModel(
      transporteOne: transporteOne ?? this.transporteOne,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [transporteOne, isSelected];
}
