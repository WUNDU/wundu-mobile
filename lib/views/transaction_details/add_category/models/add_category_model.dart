import 'package:equatable/equatable.dart';
import 'package:wundu/views/transaction_details/add_category/models/view_category_item_model.dart';

/// This class defines the variables used in the [tela_movimento_detalhes_add_categ]
/// and is typically used to hold data that is passed between different parts of the app.

// ignore_for_file: must_be_immutable
class AddCategoryModel extends Equatable {
  AddCategoryModel({this.viewCategoryItemList = const []});

  List<ViewCategoryItemModel> viewCategoryItemList;

  AddCategoryModel copyWith(
      {List<ViewCategoryItemModel>? viewCategoryItemList}) {
    return AddCategoryModel(
      viewCategoryItemList:
          viewCategoryItemList ?? this.viewCategoryItemList,
    );
  }

  @override
  List<Object?> get props => [viewCategoryItemList];
}
