import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:memo_sample/presentation/page/auth_gate.dart';

import 'generated/l10n.dart';
import 'l10n/flutter_fire_ui_ja.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'oke331/memo_sample',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FlutterFireUILocalizations.delegate,
        FlutterFireUIJaLocalizationsDelegate(),
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const AuthGate(),
    );
  }
}
