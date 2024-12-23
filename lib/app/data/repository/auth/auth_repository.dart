import '../../models/auth/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> signIn(String email, String password);
  Stream<UserModel?> get authStateChanges;
  Future<void> signOut();
}
