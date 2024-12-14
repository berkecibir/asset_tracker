import 'package:asset_tracker/app/core/utils/constants/app_regex.dart';
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
    final regex = RegExp(AppRegex.emailPattern);
    return regex.hasMatch(email) ? null : AppTexts.validateRegexcontrollMessage;
  }

  // Şifre doğrulayıcı
  static String? validatePassword(String? password, {int minLength = 6}) {
    if (password == null || password.isEmpty) {
      return AppTexts.validatePasswordMessage;
    }
    if (password.length < minLength) {
      return AppTexts.validatePasswordLengthMessage(minLength);
    }
    return null;
  }
}
