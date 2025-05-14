import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';

// ignore: must_be_immutable
class ListItemModel extends Equatable {
  ListItemModel({
    String? t,
    String? tranporte,
    String? transaEscount,
    String? kz11000,
    String? fiftyfive,
    String? id,
  })  : t = t ?? "lbl_t".tr,
        tranporte = tranporte ?? "lbl_transporte".tr,
        transaEscount = transaEscount ?? "lbl_5_transa_es".tr,
        kz11000 = kz11000 ?? "lbl_kz_11_000".tr,
        fiftyfive = fiftyfive ?? "lbl_55".tr,
        id = id ?? "";

  final String t;
  final String tranporte;
  final String transaEscount;
  final String kz11000;
  final String fiftyfive;
  final String id;

  ListItemModel copyWith({
    String? t,
    String? tranporte,
    String? transaEscount,
    String? kz11000,
    String? fiftyfive,
    String? id,
  }) {
    return ListItemModel(
      t: t ?? this.t,
      tranporte: tranporte ?? this.tranporte,
      transaEscount: transaEscount ?? this.transaEscount,
      kz11000: kz11000 ?? this.kz11000,
      fiftyfive: fiftyfive ?? this.fiftyfive,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [
        t,
        tranporte,
        transaEscount,
        kz11000,
        fiftyfive,
        id,
      ];
}
