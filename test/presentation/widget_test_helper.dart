import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:memo_sample/generated/l10n.dart';
import 'package:memo_sample/l10n/flutter_fire_ui_ja.dart';

Widget wrapWithMaterial(Widget home) {
  return MaterialApp(
    home: home,
    locale: const Locale('en'),
    localizationsDelegates: [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      FlutterFireUILocalizations.delegate,
      FlutterFireUIJaLocalizationsDelegate(),
    ],
  );
}
