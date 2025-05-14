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
        image:
            "https://images.unsplash.com/photo-1579621970563-ebec7560ff3e?w=500&auto=format",
        title: "msg_gerencie_o_seu_dinheiro".tr,
        subtitle: "msg_aprenda_a_cuidar".tr,
        actionText: "lbl_saber_mais".tr,
      ),
      GridItemModel(
        image:
            "https://images.unsplash.com/photo-1554224155-6726b3ff858f?w=500&auto=format",
        title: "msg_como_investir_o".tr,
        subtitle: "msg_aprenda_a_cuidar".tr,
        actionText: "lbl_saber_mais".tr,
      ),
      GridItemModel(
        image:
            "https://images.unsplash.com/photo-1579621970795-87facc2f976d?w=500&auto=format",
        title: "msg_gerencie_o_seu_dinheiro".tr,
        subtitle: "msg_aprenda_a_cuidar".tr,
        actionText: "lbl_saber_mais".tr,
      ),
      GridItemModel(
        image:
            "https://images.unsplash.com/photo-1554224154-26032ffc0d07?w=500&auto=format",
        title: "lbl_investimentos".tr,
        subtitle: "msg_aprenda_a_cuidar".tr,
        actionText: "lbl_saber_mais".tr,
      ),
    ];
  }
}
