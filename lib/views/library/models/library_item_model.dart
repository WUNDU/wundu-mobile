import 'package:equatable/equatable.dart';

/// This class is used in the [library_item_widget]

// ignore_for_file: must_be_immutable
class LibraryItemModel extends Equatable {
  final String? image;
  final String? title;
  final String? description;
  final String? actionText;

  const LibraryItemModel({
    this.image,
    this.title,
    this.description,
    this.actionText,
  });

  @override
  List<Object?> get props => [image, title, description, actionText];
}
