import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'pt/pt_translations.dart';

extension LocalizationExtension on String {
  String get tr => AppLocalization.of().getString(this);
}

// ignore_for_file: must_be_immutable
class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;
  static AppLocalization? _instance;
  static final Map<String, Map<String, String>> _localizedValues = {
    'pt': pt,
  };

  static AppLocalization of() {
    return _instance ??= AppLocalization(Locale('pt'));
  }

  static List<String> languages() => _localizedValues.keys.toList();

  String getString(String text) =>
      _localizedValues[locale.languageCode]?[text] ?? text;
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalization.languages().contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
