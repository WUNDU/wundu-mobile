import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/library_model.dart';
import '../models/grid_item_model.dart';

part 'library_event.dart';
part 'library_state.dart';

/// A bloc that manages the state of a Library according to the event that is dispatched to it.
class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  LibraryBloc(super.initialState) {
    on<LibraryInitialEvent>(_onInitialize);
  }

  void _onInitialize(
    LibraryInitialEvent event,
    Emitter<LibraryState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));

    emit(state.copyWith(
      libraryModelObj: state.libraryModelObj?.copyWith(
        gridItemList: fillGridItemList(),
      ),
    ));
  }

  List<GridItemModel> fillGridItemList() {
    return [
      GridItemModel(
        image: ImageConstant.logo,
        title: "msg_gerencie_o_seu_dinheiro".tr,
        subtitle: "msg_aprenda_a_cuidar".tr,
        actionText: "1bl_saber_mais".tr,
      ),
      GridItemModel(
        image: ImageConstant.logo,
        title: "msg_como_investir_o".tr,
        subtitle: "msg_aprenda_a_cuidar".tr,
        actionText: "1bl_saber_mais".tr,
      ),
      GridItemModel(
        image: ImageConstant.logo,
        title: "msg_gerencie_o_seu_dinheiro".tr,
        subtitle: "msg_aprenda_a_cuidar".tr,
        actionText: "1bl_saber_mais".tr,
      ),
      GridItemModel(
        image: ImageConstant.logo,
        title: "msg_gerencie_o_seu_dinheiro".tr,
        subtitle: "msg_aprenda_a_cuidar".tr,
        actionText: "1bl_saber_mais".tr,
      ),
    ];
  }
}
