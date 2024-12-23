import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<User?> signIn(String email, String password);
  Stream<User?> get authStateChanges;
  Future<void> signOut();
}
