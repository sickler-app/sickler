import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential newUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return newUser;
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential loggedInUser = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return loggedInUser;
  }

  Future<UserCredential> signInWithGoogle() async {
    GoogleSignIn googleSignIn =
        GoogleSignIn(scopes: ["email", "profile", "openid"]);

    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    UserCredential loggedInUser =
        await _firebaseAuth.signInWithCredential(credential);
    return loggedInUser;
  }

  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  Future<User?> getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> confirmPasswordReset(
      {required String code, required String newPassword}) async {
    await _firebaseAuth.confirmPasswordReset(
        code: code, newPassword: newPassword);
  }
}
