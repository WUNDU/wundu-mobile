import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/transaction_details/add_category/models/add_category_model.dart';
import 'package:wundu/views/transaction_details/add_category/models/view_category_item_model.dart';
part 'add_category_event.dart';
part 'add_category_state.dart';

/// A bloc that manages the state of AddCategory
class AddCategoryBloc extends Bloc<AddCategoryEvent, AddCategoryState> {
  AddCategoryBloc(super.initialState) {
    on<AddCategoryInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
  }

  Future<void> _onInitialize(
    AddCategoryInitialEvent event,
    Emitter<AddCategoryState> emit,
  ) async {
    emit(
      state.copyWith(
        descriptionController: TextEditingController(),
      ),
    );
    emit(
      state.copyWith(
        addCategoryModelObj: state.addCategoryModelObj?.copyWith(
          viewCategoryItemList: fillViewCategoryItemList(),
        ),
      ),
    );
  }

  void _updateChipView(
    UpdateChipViewEvent event,
    Emitter<AddCategoryState> emit,
  ) {
    List<ViewCategoryItemModel> newList = List<ViewCategoryItemModel>.from(
        state.addCategoryModelObj!.viewCategoryItemList);
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );

    emit(
      state.copyWith(
        addCategoryModelObj: state.addCategoryModelObj?.copyWith(
          viewCategoryItemList: newList,
        ),
      ),
    );
  }

  List<ViewCategoryItemModel> fillViewCategoryItemList() {
    return [
      ViewCategoryItemModel(transporteOne: "Transporte"),
      ViewCategoryItemModel(transporteOne: "Alimentão"),
      ViewCategoryItemModel(transporteOne: "Entretenimento"),
      ViewCategoryItemModel(transporteOne: "Saúde"),
      ViewCategoryItemModel(transporteOne: "Educação"),
      ViewCategoryItemModel(transporteOne: "Lazer"),
      ViewCategoryItemModel(transporteOne: "Outros"),
    ];
  }
}
