import 'package:flutter/material.dart';
// import 'package:video_01/demo/i18n/map/mo_demo_localization.dart';
import 'package:video_01/demo/i18n/intl/mo_demo_localizations.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locale.toString()),
            Text(
              // Localizations.of(context, MODemoLocalizations).title,
              // MODemoLocalizations.of(context).title,
              MODemoLocalizations.of(context).greet('mo'),
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}