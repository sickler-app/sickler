import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/models.dart';
import 'package:sickler/providers/auth/auth_notifier.dart';
import 'package:sickler/repositories/auth/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

///Setting up a Provider Container

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  addTearDown(container.dispose);
  return container;
}

void main() {
  late AuthRepository mockAuthRepository;
  late SicklerUser sicklerUser;
  late ProviderContainer providerContainer;
  late AsyncNotifierProvider<AuthNotifier, SicklerUser?> authProvider;

  setUpAll(() {
    mockAuthRepository = MockAuthRepository();

    authProvider = AsyncNotifierProvider<AuthNotifier, SicklerUser?>(
        () => AuthNotifier(authRepository: mockAuthRepository));

    sicklerUser = const SicklerUser(
      displayName: "test name",
      email: "test@email.com",
      uid: "uid",
      phoneNumber: "000000",
      isAnonymous: false,
      isEmailVerified: false,
    );

    registerFallbackValue(AsyncValue<SicklerUser?>.data(sicklerUser));
  });

  setUp(() {
    providerContainer = createContainer(overrides: [
      authProvider
          .overrideWith(() => AuthNotifier(authRepository: mockAuthRepository)),
    ]);
  });

  group("Tests on 'signInWithEmailAndPassword' method", () {
    test(
        "Should set 'state' to 'AsyncData(sickleruser)' object on 'signInWithEmailAndPassword' success",
        () async {
      when(() => mockAuthRepository.signInWithEmailAndPassword(
          email: "test@email.com",
          password: "12345678")).thenAnswer((_) async => Right(sicklerUser));

      final authNotifierProvider =
          providerContainer.read(authProvider.notifier);

      final listener = Listener<AsyncValue<SicklerUser?>>();
      providerContainer.listen(authProvider, listener.call);

      ///Expect the initial state should be loading
      expect(authNotifierProvider.state,
          equals(const AsyncValue<SicklerUser?>.loading()));

      ///Call sign in method
      await authNotifierProvider.signInWithEmailAndPassword(
          email: "test@email.com", password: "12345678");

      ///Verify that the listener stream i.e(state) was updated with an instance of sicklerUser
      verify(() => listener.call(any(), AsyncData<SicklerUser?>(sicklerUser)))
          .called(1);
      expect(authNotifierProvider.state,
          equals(AsyncData<SicklerUser?>(sicklerUser)));
    });
    test(
        "Should set 'state' to 'AsyncError(error)' object on 'signInWithEmailAndPassword' with FirebaseException",
        () async {
      when(() => mockAuthRepository.signInWithEmailAndPassword(
              email: "test@email.com", password: "12345678"))
          .thenAnswer((_) async =>
              const Left(Failure.firebase(errorMessage: "firebase error")));

      final authNotifierProvider =
          providerContainer.read(authProvider.notifier);
      final listener = Listener<AsyncValue<SicklerUser?>>();

      providerContainer.listen(authProvider, listener.call);

      ///Expect the initial state should be loading
      expect(authNotifierProvider.state,
          equals(const AsyncValue<SicklerUser?>.loading()));

      ///Call sign in method
      await authNotifierProvider.signInWithEmailAndPassword(
          email: "test@email.com", password: "12345678");

      ///Verify that the listener was called once with the updated state
      verify(() => listener.call(any(), any(that: isA<AsyncError>())))
          .called(1);

      final errorState = authNotifierProvider.state as AsyncError;

      expect(errorState.error, isA<Failure>());
      expect(
          (errorState.error as Failure).errorMessage, equals("firebase error"));
      expect(errorState.value, equals(SicklerUser.empty));
    });
  });

  group("Tests on 'registerWithEmailAndPassword' method", () {
    test(
        "Should set 'state' to 'AsyncData(sicklerUser)' object on 'registerWithEmailAndPassword' success",
        () async {
      when(() => mockAuthRepository.registerWithEmailAndPassword(
          email: "test@email.com",
          password: "12345678")).thenAnswer((_) async => Right(sicklerUser));

      final authNotifierProvider =
          providerContainer.read(authProvider.notifier);

      final listener = Listener<AsyncValue<SicklerUser?>>();
      providerContainer.listen(authProvider, listener.call);

      ///Expect the initial state should be loading
      expect(authNotifierProvider.state,
          equals(const AsyncValue<SicklerUser?>.loading()));

      ///Call register method
      await authNotifierProvider.registerWithEmailAndPassword(
          email: "test@email.com", password: "12345678");

      ///Verify that the listener stream i.e(state) was updated with an instance of sicklerUser
      verify(() => listener.call(any(), AsyncData<SicklerUser?>(sicklerUser)))
          .called(1);
      expect(authNotifierProvider.state,
          equals(AsyncData<SicklerUser?>(sicklerUser)));
    });
    test(
        "Should set 'state' to 'AsyncError(error)' object on 'signInWithEmailAndPassword' with FirebaseException",
        () async {
      when(() => mockAuthRepository.registerWithEmailAndPassword(
              email: "test@email.com", password: "12345678"))
          .thenAnswer((_) async =>
              const Left(Failure.firebase(errorMessage: "firebase error")));

      final authNotifierProvider =
          providerContainer.read(authProvider.notifier);
      final listener = Listener<AsyncValue<SicklerUser?>>();

      providerContainer.listen(authProvider, listener.call);

      ///Expect the initial state should be loading
      expect(authNotifierProvider.state,
          equals(const AsyncValue<SicklerUser?>.loading()));

      ///Call register method
      await authNotifierProvider.registerWithEmailAndPassword(
          email: "test@email.com", password: "12345678");

      ///Verify that the listener was called once with the updated state
      verify(() => listener.call(any(), any(that: isA<AsyncError>())))
          .called(1);

      final errorState = authNotifierProvider.state as AsyncError;

      expect(errorState.error, isA<Failure>());
      expect(
          (errorState.error as Failure).errorMessage, equals("firebase error"));
      expect(errorState.value, equals(SicklerUser.empty));
    });
  });

  group("Tests on 'signInWithGoogle' method", () {
    test(
        "Should set state to AsyncDate(sicklerUser) on 'signInWithGoogle' success",
        () async {
      when(() => mockAuthRepository.signInWithGoogle())
          .thenAnswer((_) async => Right(sicklerUser));

      ///Get instance of the provider
      final authNotifierProvider =
          providerContainer.read(authProvider.notifier);

      ///Initialise a listener to check is states are updated properly
      final listener = Listener<AsyncValue<SicklerUser?>>();
      providerContainer.listen(authProvider, listener.call);

      ///Expect initial state should be loading
      expect(authNotifierProvider.state,
          equals(const AsyncValue<SicklerUser?>.loading()));

      ///Call sign in with google method
      await authNotifierProvider.singInWithGoogle();

      ///Verify the listener was called
      verify(() => listener.call(any(), AsyncData<SicklerUser?>(sicklerUser)))
          .called(1);

      ///Expect new states to be AsyncData(sicklerUser)
      expect(authNotifierProvider.state,
          equals(AsyncData<SicklerUser?>(sicklerUser)));
    });

    test(
        "Should set state to AsyncError(failure) on signInWithGoogle with Exception/FirebaseException",
        () async {
      when(() => mockAuthRepository.signInWithGoogle()).thenAnswer(
          (_) async => const Left(Failure(errorMessage: "error occurred")));

      final authNotifierProvider =
          providerContainer.read(authProvider.notifier);
      final listener = Listener<AsyncValue<SicklerUser?>>();
      providerContainer.listen(authProvider, listener.call);

      ///Initial Value should be loading
      expect(authNotifierProvider.state,
          equals(const AsyncLoading<SicklerUser?>()));

      await authNotifierProvider.singInWithGoogle();

      verify(() => listener.call(any(), any(that: isA<AsyncError>())))
          .called(1);

      final errorState = authNotifierProvider.state as AsyncError;

      expect(errorState.error, isA<Failure>());
      expect(
          (errorState.error as Failure).errorMessage, equals("error occurred"));
      expect(errorState.value, equals(SicklerUser.empty));
    });
  });

  group("Tests on 'signOut' method", () {
    test(
        "Should set state to AsyncDate(SicklerUser.empty) on 'signOut' success",
        () async {
      when(() => mockAuthRepository.signOut())
          .thenAnswer((_) async => const Right(null));

      final authNotifierProvider =
          providerContainer.read(authProvider.notifier);

      final listener = Listener<AsyncValue<SicklerUser?>>();
      providerContainer.listen(authProvider, listener.call);

      expect(authNotifierProvider.state,
          equals(const AsyncValue<SicklerUser?>.loading()));

      await authNotifierProvider.signOut();

      verify(() =>
              listener.call(any(), AsyncData<SicklerUser?>(SicklerUser.empty)))
          .called(2);

      ///We verifiy the listener was called twice because the first time it was
      ///called with a state of SicklerUser.empty was when the state was set
      ///to loading (i.e AsyncLoading(SicklerUser.empty)) and it is called
      ///again when the sign out process is complete and the state is
      ///set to AsyncData(SicklerUser.empty);

      expect(authNotifierProvider.state,
          equals(AsyncData<SicklerUser?>(SicklerUser.empty)));
    });

    test(
        "Should set state to AsyncError(failure) on signOut failure with Exception/FirebaseException",
        () async {
      when(() => mockAuthRepository.signOut()).thenAnswer(
          (_) async => const Left(Failure(errorMessage: "failed to sign out")));

      final authNotifierProvider =
          providerContainer.read(authProvider.notifier);
      final listener = Listener<AsyncValue<SicklerUser?>>();
      providerContainer.listen(authProvider, listener.call);

      ///Initial Value should be loading
      expect(authNotifierProvider.state,
          equals(const AsyncLoading<SicklerUser?>()));

      await authNotifierProvider.signOut();

      verify(() => listener.call(any(), any(that: isA<AsyncError>())))
          .called(1);

      final errorState = authNotifierProvider.state as AsyncError;

      ///If sign out fails, the state should remain the state of the current user
      expect(errorState.error, isA<Failure>());
      expect((errorState.error as Failure).errorMessage,
          equals("failed to sign out"));
      expect(errorState.value, equals(SicklerUser.empty));
    });
  });

  group("Tests on 'sendPasswordResetEmail' method", () {
    test(
        "Should set state to AsyncData(SicklerUser.empty) on 'sendPasswordResetEmail' success",
        () async {
      when(() => mockAuthRepository.sendPasswordResetEmail(
          email: "test@email.com")).thenAnswer((_) async => const Right(null));

      final authNotifierProvider =
          providerContainer.read(authProvider.notifier);

      final listener = Listener<AsyncValue<SicklerUser?>>();
      providerContainer.listen(authProvider, listener.call);

      expect(authNotifierProvider.state,
          equals(const AsyncValue<SicklerUser?>.loading()));

      await authNotifierProvider.sendPasswordResetEmail(
          email: "test@email.com");

      verify(() =>
              listener.call(any(), AsyncData<SicklerUser?>(SicklerUser.empty)))
          .called(2);

      ///We verify the listener was called twice because the first time it was
      ///called with a state of SicklerUser.empty was when the state was set
      ///to loading (i.e AsyncLoading(SicklerUser.empty)) and it is called
      ///again when the sign out process is complete and the state is
      ///set to AsyncData(SicklerUser.empty);

      expect(authNotifierProvider.state,
          equals(AsyncData<SicklerUser?>(SicklerUser.empty)));
    });

    test(
        "Should set state to AsyncError(failure) on sendPasswordResetEmail failure with Exception/FirebaseException",
        () async {
      when(() => mockAuthRepository.sendPasswordResetEmail(
              email: "test@email.com"))
          .thenAnswer((_) async => const Left(
              Failure(errorMessage: "failed to send password reset email")));

      final authNotifierProvider =
          providerContainer.read(authProvider.notifier);
      final listener = Listener<AsyncValue<SicklerUser?>>();
      providerContainer.listen(authProvider, listener.call);

      ///Initial Value should be loading
      expect(authNotifierProvider.state,
          equals(const AsyncLoading<SicklerUser?>()));

      await authNotifierProvider.sendPasswordResetEmail(
          email: "test@email.com");

      verify(() => listener.call(any(), any(that: isA<AsyncError>())))
          .called(1);

      final errorState = authNotifierProvider.state as AsyncError;

      ///If sign out fails, the state should remain the state of the current user
      expect(errorState.error, isA<Failure>());
      expect((errorState.error as Failure).errorMessage,
          equals("failed to send password reset email"));
      expect(errorState.value, equals(SicklerUser.empty));
    });
  });

  group("Tests on 'confirmPasswordReset' method", () {
    test(
        "Should set state to AsyncData(SicklerUser.empty) on 'confirmPasswordReset' success",
        () async {
      when(() => mockAuthRepository.confirmPasswordReset(
          code: "123456",
          newPassword: "12345678")).thenAnswer((_) async => const Right(null));

      final authNotifierProvider =
          providerContainer.read(authProvider.notifier);

      final listener = Listener<AsyncValue<SicklerUser?>>();
      providerContainer.listen(authProvider, listener.call);

      expect(authNotifierProvider.state,
          equals(const AsyncValue<SicklerUser?>.loading()));

      await authNotifierProvider.confirmPasswordReset(
          code: "123456", newPassword: "12345678");

      verify(() =>
              listener.call(any(), AsyncData<SicklerUser?>(SicklerUser.empty)))
          .called(2);

      ///We verify the listener was called twice because the first time it was
      ///called with a state of SicklerUser.empty was when the state was set
      ///to loading (i.e AsyncLoading(SicklerUser.empty)) and it is called
      ///again when the sign out process is complete and the state is
      ///set to AsyncData(SicklerUser.empty);

      expect(authNotifierProvider.state,
          equals(AsyncData<SicklerUser?>(SicklerUser.empty)));
    });

    test(
        "Should set state to AsyncError(failure) on sendPasswordResetEmail failure with Exception/FirebaseException",
        () async {
      when(() => mockAuthRepository.confirmPasswordReset(
              code: "123456", newPassword: "12345678"))
          .thenAnswer((_) async =>
              const Left(Failure(errorMessage: "failed to set new password")));

      final authNotifierProvider =
          providerContainer.read(authProvider.notifier);
      final listener = Listener<AsyncValue<SicklerUser?>>();
      providerContainer.listen(authProvider, listener.call);

      ///Initial Value should be loading
      expect(authNotifierProvider.state,
          equals(const AsyncLoading<SicklerUser?>()));

      await authNotifierProvider.confirmPasswordReset(
          code: "123456", newPassword: "12345678");

      verify(() => listener.call(any(), any(that: isA<AsyncError>())))
          .called(1);

      final errorState = authNotifierProvider.state as AsyncError;

      ///If sign out fails, the state should remain the state of the current user
      expect(errorState.error, isA<Failure>());
      expect((errorState.error as Failure).errorMessage,
          equals("failed to set new password"));
      expect(errorState.value, equals(SicklerUser.empty));
    });
  });
}
