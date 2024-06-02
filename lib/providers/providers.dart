import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';
import '../services/services.dart';
import 'provider_notifiers.dart';

///------Auth Related Providers------///
final AuthService authService = AuthService();
final AuthRepository authRepository = AuthRepository(authService: authService);

final authProvider = AsyncNotifierProvider<AuthNotifier, SicklerUser?>(
    () => AuthNotifier(authRepository: authRepository));

final currentUserStreamProvider = StreamProvider<SicklerUser?>((ref) {
  return ref.watch(authProvider.notifier).getAuthStateChanges();
});
