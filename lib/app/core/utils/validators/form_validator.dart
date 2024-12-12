import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';

class FormValidator {
// Genel bir metin doğrulayıcı
  static String? validateForm(String? data) {
    return (data?.isNotEmpty ?? false) ? null : AppTexts.validateFormMessage;
  }

  // E-posta doğrulayıcı
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return AppTexts.validateEmailMessage;
    }
    // regex kontrolü
    const emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(emailPattern);
    return regex.hasMatch(email) ? null : AppTexts.validateRegexcontrollMessage;
  }

  // Şifre doğrulayıcı
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return AppTexts.validatePasswordMessage;
    }
    if (password.length < 6) {
      return AppTexts.validatePasswordLengthMessage;
    }
    return null;
  }
}
