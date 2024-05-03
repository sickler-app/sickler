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

  Stream<User?> getCurrentUser() {
    return _firebaseAuth.authStateChanges();
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential loggedInUser = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    return loggedInUser;
  }

  void signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<UserCredential> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email", "profile"]);

    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    UserCredential loggedInUser =
        await _firebaseAuth.signInWithCredential(credential);
    return loggedInUser;
  }
}

///A Try catch wrapper, might do same for either
T callMethod<T>(T Function() function) {
  try {
    return function();
  } on FirebaseException catch (e) {
    ///A Firebase Exception has occurred
    throw Exception(e.message);
  } catch (e) {
    ///An exception has occurred;
    throw Exception(e.toString());
  }
}