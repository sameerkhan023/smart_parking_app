import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import 'firebase_service.dart';

class AuthService {
  AuthService._();

  static final AuthService instance =
  AuthService._();

  final FirebaseAuth _auth =
      FirebaseAuth.instance;

  final FirebaseService _firebaseService =
      FirebaseService.instance;

  // ==========================================
  // REGISTER
  // ==========================================

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential =
      await _auth
          .createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final User? firebaseUser =
          credential.user;

      if (firebaseUser == null) {
        throw Exception(
          'User registration failed.',
        );
      }

      final UserModel user = UserModel(
        id: firebaseUser.uid,
        name: name.trim(),
        email: email.trim(),
        createdAt: DateTime.now(),
      );

      await _firebaseService.saveUser(user);

      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(
        _getAuthErrorMessage(e),
      );
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  // ==========================================
  // LOGIN
  // ==========================================

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth
          .signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(
        _getAuthErrorMessage(e),
      );
    }
  }

  // ==========================================
  // LOGOUT
  // ==========================================

  Future<void> logout() async {
    await _auth.signOut();
  }

  // ==========================================
  // CURRENT USER
  // ==========================================

  User? get currentUser {
    return _auth.currentUser;
  }

  // ==========================================
  // RESET PASSWORD
  // ==========================================

  Future<void> sendPasswordResetEmail(
      String email,
      ) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email.trim(),
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(
        _getAuthErrorMessage(e),
      );
    }
  }

  // ==========================================
  // AUTH ERROR HANDLER
  // ==========================================

  String _getAuthErrorMessage(
      FirebaseAuthException e,
      ) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'This email is already registered.';

      case 'invalid-email':
        return 'Please enter a valid email address.';

      case 'weak-password':
        return 'Password is too weak.';

      case 'user-not-found':
        return 'No account found with this email.';

      case 'wrong-password':
      case 'invalid-credential':
        return 'Incorrect email or password.';

      case 'user-disabled':
        return 'This account has been disabled.';

      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';

      case 'network-request-failed':
        return 'Please check your internet connection.';

      default:
        return e.message ??
            'Authentication failed.';
    }
  }
}