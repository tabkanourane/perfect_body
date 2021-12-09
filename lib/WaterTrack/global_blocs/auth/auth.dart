import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:perfect_body/WaterTrack/global_blocs/auth/base_auth.dart';
import 'package:perfect_body/burned_calories/services/database.dart';

class Auth implements BaseAuth {
  final _firebaseAuth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Future<String> signInAnonymously() async {
    final user = await _firebaseAuth.signInAnonymously();
    DatabaseService databaseService = DatabaseService(uid: user.uid);
    await databaseService.createNewUser(
        "test user", true, "F", 1.6, 50, 18, 1.3, "lose");
    return user.uid;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  Stream<FirebaseUser> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged;
  }

  @override
  Future<String> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final user = await _firebaseAuth.signInWithCredential(credential);
      print("Signed in ${user.uid}");
      return user.uid;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Future<String> syncWithGoogle() async {
    final anonymousUser = await _firebaseAuth.currentUser();
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final user = await anonymousUser.linkWithCredential(credential);
    return user?.uid;
  }

  @override
  Future<FirebaseUser> currentUser() {
    return _firebaseAuth.currentUser();
  }
}
