import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final hasAlreadyLoggedInProvider = StreamProvider.autoDispose((ref) {
  return FirebaseAuth.instance.authStateChanges().map((user) => user != null);
});
