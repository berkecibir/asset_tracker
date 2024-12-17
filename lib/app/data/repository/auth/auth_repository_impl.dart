import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/data/models/auth/user_model.dart';
import 'package:asset_tracker/app/data/repository/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:asset_tracker/app/core/exception/firebaseauth_exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel> signUp(String email, String password) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel(result.user?.email ?? "", password);
    } on FirebaseAuthException catch (e) {
      if (e.code == AppTexts.userNotFound) {
        throw FirebaseauthException(AppTexts.userNotFoundEmail);
      } else if (e.code == AppTexts.wrongPassword) {
        throw FirebaseauthException(AppTexts.userNotFoundEmail);
      } else {
        throw FirebaseauthException(
            '${AppTexts.errorOccurred} ${e.toString()}');
      }
    }
  }

  @override
  Stream<UserModel?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((user) {
      if (user != null) {
        return UserModel(user.email ?? "", "");
      }
      return null;
    });
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
