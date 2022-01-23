import 'package:memo_sample/presentation/controller/auth_controller/auth_controller.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';

class MockStateNotifier<T> extends StateNotifier<T> with Mock {
  MockStateNotifier(T state) : super(state);
}

class MockAuthController extends MockStateNotifier<AuthState>
    implements AuthController {
  MockAuthController(AuthState authState) : super(authState);
}
