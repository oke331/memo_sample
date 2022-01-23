import 'package:firebase_auth/firebase_auth.dart';
import 'package:memo_sample/infrastructure/model/memo.dart';
import 'package:memo_sample/infrastructure/repository/memo_repository.dart';
import 'package:memo_sample/presentation/controller/auth_controller/auth_controller.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  Memo,
  MemoRepository,
  User,
  AuthState,
])
void main() {}
