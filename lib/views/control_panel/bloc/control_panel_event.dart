part of 'control_panel_bloc.dart';

abstract class ControlPanelEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the ControlPanel widget is first created.
class ControlPanelInitialEvent extends ControlPanelEvent {
  @override
  List<Object?> get props => [];
}

/// Event to toggle the active state of the expense card.
class ToggleActiveEvent extends ControlPanelEvent {
  @override
  List<Object?> get props => [];
}

