import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wundu/views/notification/model/notification_item_model.dart';
import 'package:wundu/views/notification/model/notification_model.dart';
import '../../../core/app_export.dart';
part 'notification_event.dart';
part 'notification_state.dart';

/// A bloc that manages the state of a Notification according to the event that is dispatched
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(super.initialState) {
    on<NotificationInitialEvent>(_onInitialize);
  }

  void _onInitialize(
    NotificationInitialEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(
      state.copyWith(
        notificationModelObj: state.notificationModelObj?.copyWith(
          notificationItemList: _fillNotificationItemList(),
        ),
      ),
    );
  }

  List<NotificationItemModel> _fillNotificationItemList() {
    return [
      NotificationItemModel(
        transferNcia: ImageConstant.logo,
        transferncia1: "lbl_transfer_ncia".tr,
        time: "1b1_09_40".tr,
        recebeuuma: "msg_recebeu_uma_transfer_ncia".tr,
      ),
      NotificationItemModel(
        transferNcia: ImageConstant.logo,
        transferncia1: "lbl_d_bito".tr,
        time: "1b1_02_40".tr,
        recebeuuma: "msg_foi_debitado_na".tr,
      ),
      NotificationItemModel(
        transferNcia: ImageConstant.logo,
        transferncia1: "1bl_bloqueio".tr,
        time: "1b1_13_40".tr,
        recebeuuma: "msg_foi_efectuado_um".tr,
      ),
      NotificationItemModel(
        transferNcia: ImageConstant.logo,
        transferncia1: "lbl_biblioteca2".tr,
        time: "1b1_13_40".tr,
        recebeuuma: "msg_israel_foaram_adicionados".tr,
      ),
      NotificationItemModel(
        transferNcia: ImageConstant.logo,
        transferncia1: "lbl_ai".tr,
        time: "1b1_13_40".tr,
        recebeuuma: "msg_israel_podes_volte".tr,
      ),
    ];
  }
}
