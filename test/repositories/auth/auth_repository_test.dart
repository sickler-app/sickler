import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sickler/core/core.dart';
import 'package:sickler/models/user/sickler_user.dart';
import 'package:sickler/providers/providers.dart';
import 'package:sickler/repositories/repositories.dart';
import 'package:sickler/services/services.dart';

class MockAuthService extends Mock implements AuthService {}

class MockUserLocalService extends Mock implements UserLocalService {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {
  @override
  String? get displayName => "test name";

  @override
  String? get email => "test@email.com";

  @override
  String get uid => "uid";

  @override
  String? get phoneNumber => "000000";

  @override
  bool get emailVerified => false;

  @override
  bool get isAnonymous => false;
}

void main() {
  ///Auth Repository Tests
  late final AuthService mockedAuthService;
  // late final UserLocalService mockedUserLocalService;
  late final AuthRepository authRepository;
  late final SicklerUser sicklerUser;
  late final UserCredential mockUserCredential;
  late final User mockUser;

  setUpAll(() {
    ///Test setup
    mockedAuthService = MockAuthService();
    //  mockedUserLocalService = MockUserLocalService();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    authRepository = AuthRepository(
        authService: mockedAuthService, userLocalService: userLocalService);

    sicklerUser = const SicklerUser(
      photoUrl: "photo",
      email: "test@email.com",
      uid: "uid",
      isAnonymous: false,
      isEmailVerified: false,
      isPhoneVerified: false,
    );
    when(() => mockUserCredential.user).thenReturn(mockUser);
  });

  group("Tests on 'registerWithEmailAndPassword' method", () {
    test("Should return Right<SicklerUser?> on 'registerWithEmailAndPassword'",
        () async {
      when(() => mockedAuthService.registerWithEmailAndPassword(
          email: "test@email.com",
          password: "12345678")).thenAnswer((_) async => mockUserCredential);

      Either<Failure, SicklerUser?> response =
          await authRepository.registerWithEmailAndPassword(
              email: "test@email.com", password: "12345678");

      expect(response, Right(sicklerUser));
    });

    test(
        "Should return Left<Failure.generic> on 'registerWithEmailAndPassword' with error with error message 'test error occurred' ",
        () async {
      when(() => mockedAuthService.registerWithEmailAndPassword(
          email: "test@email.com",
          password: "12345678")).thenThrow(Exception("test error occurred"));

      Either<Failure, SicklerUser?> response =
          await authRepository.registerWithEmailAndPassword(
              email: "test@email.com", password: "12345678");

      expect(
        response,
        const Left(Failure.generic(message: "test error occurred")),
      );
    });
    test(
        "Should return Left<Failure.firebase> on 'registerWithEmailAndPassword' with 'FirebaseException' with error message 'firebase test error occurred'",
        () async {
      when(() => mockedAuthService.registerWithEmailAndPassword(
              email: "test@email.com", password: "12345678"))
          .thenThrow(FirebaseException(
              plugin: "firebaseAuth", message: "firebase test error occurred"));

      Either<Failure, SicklerUser?> response =
          await authRepository.registerWithEmailAndPassword(
              email: "test@email.com", password: "12345678");

      expect(
        response,
        const Left(Failure.firebase(message: "firebase test error occurred")),
      );
    });
  });

  group("Tests on 'signInWithEmailAndPassword' method", () {
    test("Should return SicklerUser? on 'signInWithEmailAndPassword'",
        () async {
      when(() => mockedAuthService.signInWithEmailAndPassword(
          email: "test@email.com",
          password: "12345678")).thenAnswer((_) async => mockUserCredential);

      Either<Failure, SicklerUser?> response =
          await authRepository.signInWithEmailAndPassword(
              email: "test@email.com", password: "12345678");

      expect(response, Right(sicklerUser));
    });

    test(
        "Should return Left<Failure.generic> on 'signInWithEmailAndPassword' with 'Exception' with error message 'test error occurred'",
        () async {
      when(() => mockedAuthService.signInWithEmailAndPassword(
          email: "test@email.com",
          password: "12345678")).thenThrow(Exception("test error occurred"));

      Either<Failure, SicklerUser?> response =
          await authRepository.signInWithEmailAndPassword(
              email: "test@email.com", password: "12345678");

      expect(
        response,
        const Left(Failure.generic(message: "test error occurred")),
      );
    });

    test(
        "Should return Left<Failure.firebase> on 'signInWithEmailAndPassword' with 'FirebaseException' with error message 'firebase test error occurred'",
        () async {
      when(() => mockedAuthService.signInWithEmailAndPassword(
              email: "test@email.com", password: "12345678"))
          .thenThrow(FirebaseException(
              plugin: "firebaseAuth", message: "firebase test error occurred"));

      Either<Failure, SicklerUser?> response =
          await authRepository.signInWithEmailAndPassword(
              email: "test@email.com", password: "12345678");

      expect(
        response,
        const Left(Failure.firebase(message: "firebase test error occurred")),
      );
    });
  });

  group("Tests on 'signInWithGoogleMethod' method", () {
    test("Should return Right<SicklerUser?> on 'signInWithGoogle' success",
        () async {
      when(() => mockedAuthService.signInWithGoogle())
          .thenAnswer((_) async => mockUserCredential);

      Either<Failure, SicklerUser?> response =
          await authRepository.signInWithGoogle();

      expect(response, Right(sicklerUser));
    });

    test(
        "Should return Left<Failure.generic> on 'signInWithGoogle' with Exception with error message 'test error occurred' ",
        () async {
      when(() => mockedAuthService.signInWithGoogle())
          .thenThrow(Exception("test error occurred"));

      Either<Failure, SicklerUser?> response =
          await authRepository.signInWithGoogle();

      expect(
        response,
        const Left(Failure.generic(message: "test error occurred")),
      );
    });
    test(
        "Should return Left<Failure.firebase> on 'signInWithGoogle' with 'FirebaseException' with error message 'firebase test error occurred'",
        () async {
      when(() => mockedAuthService.signInWithGoogle()).thenThrow(
          FirebaseException(
              plugin: "firebaseAuth", message: "firebase test error occurred"));

      Either<Failure, SicklerUser?> response =
          await authRepository.signInWithGoogle();

      expect(
        response,
        const Left(Failure.firebase(message: "firebase test error occurred")),
      );
    });
  });

  group("Tests on 'signOut' method", () {
    test("Should return Right<void> on 'signOut' success", () async {
      when(() => mockedAuthService.signOut()).thenAnswer((_) async {});

      Either<Failure, void> response = await authRepository.signOut();

      expect(response, const Right(null));
    });
    test(
        "Should return Left<Failure.generic> on 'signOut' with Exception with error message 'test error occurred' ",
        () async {
      when(() => mockedAuthService.signOut())
          .thenThrow(Exception("test error occurred"));

      Either<Failure, void> response = await authRepository.signOut();

      expect(response,
          const Left(Failure.generic(message: "test error occurred")));
    });
    test(
        "Should return Left<Failure.firebase> on 'signOut' with FirebaseException with error message 'firebase test error occurred' ",
        () async {
      when(() => mockedAuthService.signOut()).thenThrow(FirebaseException(
          plugin: "Firebase Auth", message: "firebase test error occurred"));

      Either<Failure, void> response = await authRepository.signOut();

      expect(
          response,
          const Left(
              Failure.firebase(message: "firebase test error occurred")));
    });
  });

  group("Tests on 'sendPasswordResetEmail' method", () {
    test("Should return Right<void> on 'sendPasswordResetEmail' success",
        () async {
      when(() =>
              mockedAuthService.sendPasswordResetEmail(email: "test@email.com"))
          .thenAnswer((_) async {});

      Either<Failure, void> response =
          await authRepository.sendPasswordResetEmail(email: "test@email.com");

      expect(response, const Right(null));
    });
    test(
        "Should return Left<Failure.generic> on 'sendPasswordResetEmail' with Exception with error message 'test error occurred' ",
        () async {
      when(() =>
              mockedAuthService.sendPasswordResetEmail(email: "test@email.com"))
          .thenThrow(Exception("test error occurred"));

      Either<Failure, void> response =
          await authRepository.sendPasswordResetEmail(email: "test@email.com");

      expect(response,
          const Left(Failure.generic(message: "test error occurred")));
    });
    test(
        "Should return Left<Failure.firebase> on 'sendPasswordResetEmail' with FirebaseException with error message 'firebase test error occurred' ",
        () async {
      when(() =>
              mockedAuthService.sendPasswordResetEmail(email: "test@email.com"))
          .thenThrow(FirebaseException(
              plugin: "Firebase Auth",
              message: "firebase test error occurred"));

      Either<Failure, void> response =
          await authRepository.sendPasswordResetEmail(email: "test@email.com");

      expect(
          response,
          const Left(
              Failure.firebase(message: "firebase test error occurred")));
    });
  });

  group("Tests on 'confirmPasswordReset' method", () {
    test("Should return Right<void> on 'confirmPasswordReset' success",
        () async {
      when(() => mockedAuthService.confirmPasswordReset(
          code: "000000", newPassword: "12345678")).thenAnswer((_) async {});

      Either<Failure, void> response = await authRepository
          .confirmPasswordReset(code: "000000", newPassword: "12345678");

      expect(response, const Right(null));
    });
    test(
        "Should return Left<Failure.generic> on 'confirmPasswordReset' with Exception with error message 'test error occurred' ",
        () async {
      when(() => mockedAuthService.confirmPasswordReset(
          code: "000000",
          newPassword: "12345678")).thenThrow(Exception("test error occurred"));

      Either<Failure, void> response = await authRepository
          .confirmPasswordReset(code: "000000", newPassword: "12345678");

      expect(response,
          const Left(Failure.generic(message: "test error occurred")));
    });
    test(
        "Should return Left<Failure.firebase> on 'confirmPasswordReset' with FirebaseException with error message 'firebase test error occurred' ",
        () async {
      when(() => mockedAuthService.confirmPasswordReset(
              code: "000000", newPassword: "12345678"))
          .thenThrow(FirebaseException(
              plugin: "Firebase Auth",
              message: "firebase test error occurred"));

      Either<Failure, void> response = await authRepository
          .confirmPasswordReset(code: "000000", newPassword: "12345678");

      expect(
          response,
          const Left(
              Failure.firebase(message: "firebase test error occurred")));
    });
  });
}
