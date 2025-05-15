part of 'control_panel_bloc.dart';

// ignore: must_be_immutable
class ControlPanelState extends Equatable {
  ControlPanelState({this.controlPanelModelObj, this.isActive = false});

  ControlPanelModel? controlPanelModelObj;
  final bool isActive;

  @override
  List<Object?> get props => [controlPanelModelObj, isActive];
  ControlPanelState copyWith({
    ControlPanelModel? controlPanelModelObj,
    bool? isActive,
  }) {
    return ControlPanelState(
      controlPanelModelObj: controlPanelModelObj ?? this.controlPanelModelObj,
      isActive: isActive ?? this.isActive,
    );
  }
}
