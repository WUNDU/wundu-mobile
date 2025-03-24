import 'dart:ui';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class HomeScreenItemModel extends Equatable {
  HomeScreenItemModel({
    this.transactionType,
    this.ibanCounter,
    this.backgroundColor,
    this.iconPath,
  });

  String? transactionType;
  String? ibanCounter;
  Color? backgroundColor;
  String? iconPath;

  HomeScreenItemModel copyWith({
    String? transactionType,
    String? ibanCounter,
    Color? backgroundColor,
    String? iconPath,
  }) {
    return HomeScreenItemModel(
      transactionType: transactionType ?? this.transactionType,
      ibanCounter: ibanCounter ?? this.ibanCounter,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconPath: iconPath ?? this.iconPath,
    );
  }

  @override
  List<Object?> get props => [
        transactionType,
        ibanCounter,
        backgroundColor,
        iconPath,
      ];
}
