import 'package:equatable/equatable.dart';

class GridItemModel extends Equatable {
  final String? image;
  final String? title;
  final String? subtitle;
  final String? actionText;

  const GridItemModel({
    this.image,
    this.title,
    this.subtitle,
    this.actionText,
  });

  @override
  List<Object?> get props => [image, title, subtitle, actionText];
}
