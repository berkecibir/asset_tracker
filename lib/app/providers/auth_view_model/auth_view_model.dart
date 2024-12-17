import 'package:flutter/material.dart';

import '../../data/models/auth/user_model.dart';
import '../../data/repository/auth/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  AuthViewModel(this._authRepository);

  UserModel? _user;
  UserModel? get user => _user;

  bool get isAuthenticated => _user != null;

  void listenToAuthStateChanges() {
    _authRepository.authStateChanges.listen((userModel) {
      _user = userModel;
      notifyListeners();
    });
  }

  Future<void> signUp(String email, String password) async {
    try {
      _user = await _authRepository.signUp(email, password);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    _user = null;
    notifyListeners();
  }
}
