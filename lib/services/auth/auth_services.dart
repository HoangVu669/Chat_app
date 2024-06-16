import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Get user data from Firestore
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userData = await _firestore
          .collection("Users")
          .doc(user.uid)
          .get();
      return userData;
    } else {
      throw Exception("User is not logged in.");
    }
  }

  // Login
  Future<UserCredential> logInWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // No need to set user data here, it's already set during sign up
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // SignUp
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    try {
      // Create user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save user data to Firestore
      await _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // LogOut
  Future<void> logOut() async {
    return await _auth.signOut();
  }

// Errors
}
