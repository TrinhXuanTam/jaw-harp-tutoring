import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  Map<String, String> _localizedStrings;

  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// InheritedWidget "of" style syntax helper function
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// Load map of localized strings
  Future<void> load() async {
    String json = await rootBundle.loadString("assets/l10n/${locale.languageCode}.json");
    _localizedStrings = Map<String, String>.from(jsonDecode(json));
  }

  /// return translated string
  String translate(String key) {
    if (!_localizedStrings.containsKey(key))
      return key;
    else
      return _localizedStrings[key];
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  /// Check if locale is supported
  @override
  bool isSupported(Locale locale) {
    return ['en', 'cs'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}
