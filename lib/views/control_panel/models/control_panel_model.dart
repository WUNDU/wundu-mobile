import 'package:equatable/equatable.dart';
import 'package:wundu/views/control_panel/models/list_item_model.dart';

// ignore: must_be_immutable
class ControlPanelModel extends Equatable {
  ControlPanelModel({this.listItemList = const []});

  List<ListItemModel> listItemList;

  ControlPanelModel copyWith({
    List<ListItemModel>? listItemList,
  }) {
    return ControlPanelModel(
      listItemList:
          listItemList ?? this.listItemList,
    );
  }

  @override
  List<Object?> get props => [listItemList];
}
