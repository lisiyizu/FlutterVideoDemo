import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class MODemoLocalizations {
  final Locale locale;

  MODemoLocalizations(this.locale);

  static MODemoLocalizations of(BuildContext context) {
    return Localizations.of<MODemoLocalizations>(context, MODemoLocalizations);
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title' : 'hello',
    },
    'zh': {
      'title': '您好',
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class MODemoLocalizationsDelegate 
  extends LocalizationsDelegate<MODemoLocalizations> {
  MODemoLocalizationsDelegate();

  @override
  Future<MODemoLocalizations> load(Locale locale) {
    return SynchronousFuture<MODemoLocalizations>(
      MODemoLocalizations(locale)
    );
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<MODemoLocalizations> old) {
    return false;
  }
}