import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/card/models/card_screen_model.dart';

part 'card_screen_state.dart';
part 'card_screen_event.dart';

class CardScreenBloc extends Bloc<CardScreenEvent, CardScreenState> {
  CardScreenBloc(super.initialState){
      on<CardScreenInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CardScreenInitialEvent event,
    Emitter<CardScreenState> emit
  ) async{

  }
}
