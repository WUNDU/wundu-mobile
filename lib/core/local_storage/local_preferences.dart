import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  static final LocalPreferences _instance = LocalPreferences._internal();
  factory LocalPreferences() => _instance;
  LocalPreferences._internal();

  static const _onboardingKey = 'onboarding_completed';

  Future<void> setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingKey, true);
  }

  Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingKey) ?? false;
  }
}
