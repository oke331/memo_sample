import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_sample/infrastructure/provider/firebase_provider.dart';

part "auth_controller.freezed.dart";

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController._(ref.watch(firebaseAuthProvider)),
);

class AuthController extends StateNotifier<AuthState> {
  AuthController._(
    this._auth,
  ) : super(AuthState()) {
    _auth.authStateChanges().listen(
      (user) {
        state = state.copyWith(
          firebaseUser: AsyncValue.data(user),
        );
      },
    );
  }

  final FirebaseAuth _auth;

  Future<void> signOut() => _auth.signOut();
}

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    @Default(AsyncValue<User?>.loading()) AsyncValue<User?> firebaseUser,
  }) = _AuthState;
  AuthState._();

  late final bool hasAlreadySignedIn = firebaseUser.value != null;
}
