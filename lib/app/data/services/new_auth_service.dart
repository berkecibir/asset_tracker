import 'package:asset_tracker/app/core/duration/app_duration.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/data/models/auth/user_model.dart';
import 'package:asset_tracker/app/data/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewAuthService implements AuthService {
  final List<UserModel> _mockServiceUser = [
    const UserModel(AppTexts.mockMail, AppTexts.mockPassword)
  ];

  @override
  Stream<User?> get authStateChanges async* {
    // mock oldugu icin null dönecek
    yield null;
  }

  @override
  Future<User?> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: AppDuration.oneSecond));

    try {
      _mockServiceUser.firstWhere(
        (user) => user.email == email && user.password == password,
      );

      return null;
    } catch (_) {
      throw Exception(AppTexts.mockServiceException);
    }
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: AppDuration.oneSecond));
  }
}
