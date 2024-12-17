import 'package:asset_tracker/app/core/exception/firebaseauth_exception.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == AppTexts.userNotFound) {
        throw FirebaseauthException(AppTexts.userNotFoundEmail);
      } else if (e.code == AppTexts.wrongPassword) {
        throw FirebaseauthException(AppTexts.enteredWrongPassword);
      } else {
        throw FirebaseauthException(
            '${AppTexts.errorOccurred} ${e.toString()}');
      }
    } catch (e) {
      throw FirebaseauthException('${AppTexts.errorOccurred} ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
