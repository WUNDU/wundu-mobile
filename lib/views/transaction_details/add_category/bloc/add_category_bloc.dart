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
    on<UpdateDescriptionEvent>(_updateDescription);
    on<SaveCategoryEvent>(_saveCategory);
  }

  Future<void> _onInitialize(
    AddCategoryInitialEvent event,
    Emitter<AddCategoryState> emit,
  ) async {
    emit(
      state.copyWith(
        descriptionController: TextEditingController(),
        isCategorySelected: false,
        isDescriptionFilled: false,
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

    // Desmarcar todas as categorias
    for (int i = 0; i < newList.length; i++) {
      newList[i] = newList[i].copyWith(isSelected: false);
    }

    // Selecionar a categoria clicada
    if (event.isSelected == true) {
      newList[event.index] = newList[event.index].copyWith(isSelected: true);
    }

    emit(
      state.copyWith(
        addCategoryModelObj: state.addCategoryModelObj?.copyWith(
          viewCategoryItemList: newList,
        ),
        isCategorySelected: event.isSelected == true,
      ),
    );
  }

  void _updateDescription(
    UpdateDescriptionEvent event,
    Emitter<AddCategoryState> emit,
  ) {
    emit(
      state.copyWith(
        isDescriptionFilled: event.description.isNotEmpty,
      ),
    );
  }

  void _saveCategory(
    SaveCategoryEvent event,
    Emitter<AddCategoryState> emit,
  ) {
    final selectedCategory = state.addCategoryModelObj?.viewCategoryItemList
        .firstWhere((item) => item.isSelected ?? false,
            orElse: () => ViewCategoryItemModel())
        .transporteOne;

    event.onCategorySaved(selectedCategory);
    emit(state.copyWith());
  }
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
