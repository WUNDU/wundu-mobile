import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wundu/views/auth/models/auth_screen_model.dart';
part 'auth_screen_event.dart';
part 'auth_screen_state.dart';

class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  AuthScreenBloc(super.initialState) {
    on<AuthScreenInitialEvent>(_onInitialize);
  }

  _onInitialize(
      AuthScreenInitialEvent event, Emitter<AuthScreenState> emit) async {}
}
