import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wundu/views/profile/model/profile.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(super.initialState) {
    on<ProfileInitialEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
    ProfileInitialEvent event,
    Emitter<ProfileState> emit,
  ) async {}
}
