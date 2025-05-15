import 'package:equatable/equatable.dart';
import 'library_item_model.dart';

// ignore_for_file: must_be_immutable
class LibraryDetailModel extends Equatable {
  LibraryDetailModel({this.libraryItemList = const []});

  List<LibraryItemModel> libraryItemList;

  LibraryDetailModel copyWith({
    List<LibraryItemModel>? libraryItemList,
  }) {
    return LibraryDetailModel(
      libraryItemList: libraryItemList ?? this.libraryItemList,
    );
  }

  @override
  List<Object?> get props => [libraryItemList];
}
