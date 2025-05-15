
// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';

class NotificationItemModel extends Equatable {
 NotificationItemModel({
    this.transferNcia,
    this.transferncia1,
    this.time,
    this.recebeuuma,
    this.id,
  }) {
    transferNcia = transferNcia ?? ImageConstant.logo;
    transferncia1 = transferncia1 ?? "lbl_transfer_ncia".tr;
    time = time ?? "1b1_09_40".tr;
    recebeuuma = recebeuuma ?? "msg_recebeu_uma_transfer_ncia".tr;
    id = id ?? "";
  }

  String? transferNcia;
  String? transferncia1;
  String? time;
  String? recebeuuma;
  String? id;

  @override
  List<Object?> get props => [transferNcia, transferncia1, time, recebeuuma, id];

  NotificationItemModel copyWith({
    String? transferNcia,
    String? transferncia1,
    String? time,
    String? recebeuuma,
    String? id,
  }) {
    return NotificationItemModel(
      transferNcia: transferNcia ?? this.transferNcia,
      transferncia1: transferncia1 ?? this.transferncia1,
      time: time ?? this.time,
      recebeuuma: recebeuuma ?? this.recebeuuma,
      id: id ?? this.id,
    );
  }
}