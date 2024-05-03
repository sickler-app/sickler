import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/repositories/auth/auth_repository.dart';

class AuthProvider extends AsyncNotifier {
  final AuthRepository authRepository;

  AuthProvider({required this.authRepository});

  AppState appState = AppState.initial;

  @override
  FutureOr build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}
