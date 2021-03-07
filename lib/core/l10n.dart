import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jews_harp/core/errors/language_not_supported_error.dart';

class Language {
  final String code;
  final String name;
  final String nativeName;

  Language(this.code, this.name, this.nativeName);
}

class SupportedLanguages {
  static final languages = [
    Language("en", "English", "English"),
    Language("cs", "Czech", "Čeština"),
  ];

  static String getNativeName(String languageCode) {
    final language = languages.firstWhere(
      (element) => element.code == languageCode,
      orElse: () => throw LanguageNotSupportedError(),
    );

    return language.nativeName;
  }

  static String getName(String languageCode) {
    final language = languages.firstWhere(
      (element) => element.code == languageCode,
      orElse: () => throw LanguageNotSupportedError(),
    );

    return language.name;
  }

  static Iterable<String> getCodes() => languages.map((e) => e.code);
}

class AppLocalizations {
  final Locale locale;
  late Map<String, String> _localizedStrings;

  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// InheritedWidget "of" style syntax helper function
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  /// Load map of localized strings
  Future<void> load() async {
    String json = await rootBundle.loadString("assets/l10n/${locale.languageCode}.json");
    _localizedStrings = Map<String, String>.from(jsonDecode(json));
  }

  /// return translated string
  String translate(String key) {
    final translation = _localizedStrings[key];

    if (translation == null) return key;

    return translation;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  /// Check if locale is supported
  @override
  bool isSupported(Locale locale) {
    return SupportedLanguages.getCodes().contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations l10n = AppLocalizations(locale);
    await l10n.load();
    return l10n;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}
