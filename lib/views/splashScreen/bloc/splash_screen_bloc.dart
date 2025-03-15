import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/splashScreen/models/splash_screen_model.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc(super.initialState) {
    on<SplashScreenInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SplashScreenInitialEvent event,
    Emitter<SplashScreenState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 3));

    NavigatorService.pushNamedAndRemovedUntil(AppRoutes.onboardScreen);
  }
}
