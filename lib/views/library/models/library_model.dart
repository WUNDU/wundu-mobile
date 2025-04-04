import 'package:equatable/equatable.dart';
import 'grid_item_model.dart';

class LibraryModel extends Equatable {
  final List<GridItemModel>? gridItemList;

  const LibraryModel({
    this.gridItemList,
  });

  LibraryModel copyWith({
    List<GridItemModel>? gridItemList,
  }) {
    return LibraryModel(
      gridItemList: gridItemList ?? this.gridItemList,
    );
  }

  @override
  List<Object?> get props => [gridItemList];
}
