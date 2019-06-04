import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'mo_demo_messages_all.dart';

class MODemoLocalizations {
  static MODemoLocalizations of(BuildContext context) {
    return Localizations.of<MODemoLocalizations>(context, MODemoLocalizations);
  }

  static Future<MODemoLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return MODemoLocalizations();
    });
  }

  String get title => Intl.message(
    'hello',
    name: 'title',
    desc: 'demo localizations',
  );

  String greet(String name) => Intl.message(
    'hello $name',
    name: 'greet',
    desc: 'greet someone',
    args: [name],
  );
}

class MODemoLocalizationsDelegate 
  extends LocalizationsDelegate<MODemoLocalizations> {
  MODemoLocalizationsDelegate();

  @override
  Future<MODemoLocalizations> load(Locale locale) {
    return MODemoLocalizations.load(locale);
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