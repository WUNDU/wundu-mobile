import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/control_panel/models/control_panel_model.dart';
import 'package:wundu/views/control_panel/models/list_item_model.dart';

part 'control_panel_event.dart';
part 'control_panel_state.dart';

class ControlPanelBloc extends Bloc<ControlPanelEvent, ControlPanelState> {
  ControlPanelBloc(super.initialState) {
    on<ControlPanelInitialEvent>(_onInitialize);
    on<ToggleActiveEvent>(_onToggleActive);
  }

  Future<void> _onInitialize(
    ControlPanelInitialEvent event,
    Emitter<ControlPanelState> emit,
  ) async {
    emit(
      state.copyWith(
        controlPanelModelObj: state.controlPanelModelObj?.copyWith(
          listItemList: _fillControlPanelOneListItemList(),
        ),
      ),
    );
  }

  Future<void> _onToggleActive(
    ToggleActiveEvent event,
    Emitter<ControlPanelState> emit,
  ) async {
    emit(state.copyWith(isActive: !state.isActive));
  }

  List<ListItemModel> _fillControlPanelOneListItemList() {
    return [
      ListItemModel(
        t: "lbl_t".tr,
        tranporte: "lbl_transporte".tr,
        transaEscount: "lbl_5_transa_es".tr,
        kz11000: "lbl_kz_11_000".tr,
        fiftyfive: "lbl_55".tr,
      ),
      ListItemModel(
        t: "lbl_s".tr,
        tranporte: "lbl_sa_de".tr,
        transaEscount: "lbl_2_transa_es".tr,
        kz11000: "lbl_kz_5_000".tr,
        fiftyfive: "lbl_25".tr,
      ),
      ListItemModel(
        t: "lbl_r".tr,
        tranporte: "lbl_recebido".tr,
        transaEscount: "lbl_1_transa_es".tr,
        kz11000: "lbl_kz_30_000".tr,
        fiftyfive: "lbl_20".tr,
      ),
    ];
  }
}
