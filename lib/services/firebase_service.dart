import 'package:firebase_database/firebase_database.dart';

import '../models/user_model.dart';

class FirebaseService {
  FirebaseService._();

  static final FirebaseService instance =
  FirebaseService._();

  final FirebaseDatabase _database =
      FirebaseDatabase.instance;

  // ==========================================
  // USERS
  // ==========================================

  Future<void> saveUser(UserModel user) async {
    try {
      final DatabaseReference userRef =
      _database.ref('users/${user.id}');

      await userRef.set(
        user.toMap(),
      );
    } catch (e) {
      throw Exception(
        'Failed to save user: $e',
      );
    }
  }

  // ==========================================
  // GET USER
  // ==========================================

  Future<UserModel?> getUser(
      String userId,
      ) async {
    try {
      final DatabaseEvent event =
      await _database
          .ref('users/$userId')
          .once();

      final Object? data = event.snapshot.value;

      if (data == null) {
        return null;
      }

      return UserModel.fromMap(
        Map<String, dynamic>.from(
          data as Map,
        ),
      );
    } catch (e) {
      throw Exception(
        'Failed to get user: $e',
      );
    }
  }

  // ==========================================
  // UPDATE USER
  // ==========================================

  Future<void> updateUser(
      String userId,
      Map<String, dynamic> data,
      ) async {
    try {
      await _database
          .ref('users/$userId')
          .update(data);
    } catch (e) {
      throw Exception(
        'Failed to update user: $e',
      );
    }
  }

  // ==========================================
  // DELETE USER DATA
  // ==========================================

  Future<void> deleteUser(
      String userId,
      ) async {
    try {
      await _database
          .ref('users/$userId')
          .remove();
    } catch (e) {
      throw Exception(
        'Failed to delete user: $e',
      );
    }
  }
}