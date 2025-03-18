import 'package:equatable/equatable.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/session/session_service.dart';
import 'package:wundu/views/splash/models/splash_screen_model.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final LocalPreferences _localPreferences = LocalPreferences();
  final SessionService _sessionService = SessionService();

  SplashScreenBloc(super.initialState) {
    on<SplashScreenInitialEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
    SplashScreenInitialEvent event,
    Emitter<SplashScreenState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 3));

    final isOnboardingCompleted =
        await _localPreferences.isOnboardingCompleted();
    final hasValidSession = await _sessionService.isSessionValid();

    if (hasValidSession) {
      NavigatorService.pushNamedAndRemovedUntil(AppRoutes.mainScreen);
    } else if (isOnboardingCompleted) {
      NavigatorService.pushNamedAndRemovedUntil(AppRoutes.authScreen);
    } else {
      NavigatorService.pushNamedAndRemovedUntil(AppRoutes.onboardScreen);
    }
  }
}
