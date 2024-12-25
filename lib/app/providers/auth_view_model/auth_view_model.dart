import 'package:flutter/material.dart';

import '../../data/models/auth/user_model.dart';
import '../../data/repository/auth/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  final AuthRepository _authRepository;
  AuthViewModel(this._authRepository);

  UserModel? _user;
  UserModel? get user => _user;

  bool get isAuthenticated => _user != null;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void listenToAuthStateChanges() {
    _authRepository.authStateChanges.listen((userModel) {
      _user = userModel;
      notifyListeners();
    });
  }

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      _user = await _authRepository.signIn(email, password);
      notifyListeners();
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authRepository.signOut();
      _user = null;
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
