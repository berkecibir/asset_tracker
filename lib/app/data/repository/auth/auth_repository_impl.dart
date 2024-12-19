import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/data/models/auth/user_model.dart';
import 'package:asset_tracker/app/data/repository/auth/auth_repository.dart';
import 'package:asset_tracker/app/data/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/exception/firebaseauth_exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<UserModel> signUp(String email, String password) async {
    try {
      final user = await _authService.createUser(email, password);
      return UserModel(user?.email ?? '', password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseauthException(_mapErrorCodeToMessage(e.code));
    }
  }

  @override
  Stream<UserModel?> get authStateChanges {
    return _authService.authStateChanges.map((user) {
      if (user != null) {
        return UserModel(user.email ?? "", "");
      }
      return null;
    });
  }

  @override
  Future<void> signOut() async {
    await _authService.signOut();
  }

  String _mapErrorCodeToMessage(String errorCode) {
    const errorMessages = {
      AppTexts.userNotFound: AppTexts.userNotFound,
      AppTexts.wrongPassword: AppTexts.wrongPassword,
    };
    return errorMessages[errorCode] ?? AppTexts.errorOccurred;
  }
}
