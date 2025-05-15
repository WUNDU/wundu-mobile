import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wundu/views/app_navigation/models/app_navigation_model.dart';

part 'app_navigation_event.dart';
part 'app_navigation_state.dart';

class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> {
  AppNavigationBloc(AppNavigationState appNavigationState) : super(AppNavigationState()) {
    on<AppNavigationInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AppNavigationInitialEvent event,
    Emitter<AppNavigationState> emit,
  ) async {}
}
