import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/home/models/home_screen_model.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc(super.initialState) {
    on<HomeScreenInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomeScreenInitialEvent event,
    Emitter<HomeScreenState> emit,
  ) async {}
}
