import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/util/logger_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'infrastructure/repository/theme_mode_repository.dart';
import 'util/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebaseの初期設定
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Firebaseエミュレータの設定
  const isEmulator = bool.fromEnvironment('IS_EMULATOR');
  logger.i('start(isEmulator: $isEmulator)');
  if (isEmulator) {
    const localhost = 'localhost';
    FirebaseFirestore.instance.useFirestoreEmulator(localhost, 8080);
    await FirebaseAuth.instance.useAuthEmulator(localhost, 9099);
  } else if (kIsWeb) {
    // hot restart時にエラーとなるためコメントアウト
    // await FirebaseFirestore.instance.enablePersistence(
    //   const PersistenceSettings(synchronizeTabs: true),
    // );
    // await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  }

  // URLから#を除く
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const App(),
    ),
  );
}
