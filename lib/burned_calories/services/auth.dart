// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:perfect_body/burned_calories/model/user.dart';
// import 'package:perfect_body/burned_calories/services/database.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // create user object based on FirebaseUser
//   User _userFromFirebaseUser(FirebaseUser user) {
//     return user != null ? User(uid: user.uid) : null;
//   }

//   // auth change user stream
//   Stream<User> get user {
//     return _auth.onAuthStateChanged.map((_userFromFirebaseUser));
//   }

//   // sign in anonymously
//   Future signInAnon() async {
//     try {
//       AuthResult result = await _auth.signInAnonymously();
//       FirebaseUser firebaseUser = result.user;
//       return _userFromFirebaseUser(firebaseUser);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   // TODO: special error messages depending on what happened
//   // sign in with email and password
//   Future signInWithEmailAndPassword(String email, String password) async {
//     print(email);
//     print(password);
//     AuthResult result = await _auth.signInWithEmailAndPassword(
//         email: email.trim(), password: password);
//     FirebaseUser firebaseUser = result.user;
//     return _userFromFirebaseUser(firebaseUser);
//   }

//   // register with email and password
//   Future registerWithEmailAndPassword(String email, String password) async {
//     AuthResult result = await _auth.createUserWithEmailAndPassword(
//         email: email.trim(), password: password);
//     FirebaseUser firebaseUser = result.user;

//     // create a new document for the user with uid
//     // TODO: should ask after registering
//     DatabaseService databaseService = DatabaseService(uid: firebaseUser.uid);
//     await databaseService.createNewUser(
//         "test user", true, "F", 1.6, 50, 18, 1.3, "lose");
//     return _userFromFirebaseUser(firebaseUser);
//   }

//   // sign out
//   Future signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }
