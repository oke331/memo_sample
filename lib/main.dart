import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/util/logger_util.dart';

import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
  }

  runApp(const ProviderScope(child: App()));
}
