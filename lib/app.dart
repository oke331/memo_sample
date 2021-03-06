import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/presentation/controller/theme_mode_controller/theme_mode_controller.dart';
import 'package:memo_sample/router.dart';

import 'generated/l10n.dart';
import 'l10n/flutter_fire_ui_ja.dart';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    ref.listen(
      rooterRefreshListenableProvider,
      (_, __) => router.refresh(),
    );

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      onGenerateTitle: (context) => S.of(context).appName,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FlutterFireUILocalizations.delegate,
        FlutterFireUIJaLocalizationsDelegate(),
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData.from(colorScheme: const ColorScheme.light()),
      darkTheme: ThemeData.from(colorScheme: const ColorScheme.dark()),
      themeMode: ref.watch(themeModeControllerProvider),
    );
  }
}
