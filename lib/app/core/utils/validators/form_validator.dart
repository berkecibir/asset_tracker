class FormValidator {
// Genel bir metin doğrulayıcı
  static String? validateForm(String? data) {
    return (data?.isNotEmpty ?? false) ? null : 'Bu alan boş geçilemez';
  }

  // E-posta doğrulayıcı
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'E-posta boş geçilemez';
    }
    // regex kontrolü
    const emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(emailPattern);
    return regex.hasMatch(email) ? null : 'Geçerli bir e-posta adresi giriniz';
  }

  // Şifre doğrulayıcı
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Şifre boş geçilemez';
    }
    if (password.length < 6) {
      return 'Şifre en az 6 karakter olmalıdır';
    }
    return null;
  }
}
