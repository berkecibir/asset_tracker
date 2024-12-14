class AppTexts {
  // Auth Strings
  static const loginPageGreet = 'Hoş Geldiniz';
  static const loginButtonTitle = 'Giriş Yap';

  // Validator Strings

  static const validateFormMessage = 'Bu alan boş geçilemez';
  static const validateEmailMessage = 'E-posta boş geçilemez';
  static const validateRegexcontrollMessage =
      'Geçerli bir e-posta adresi giriniz';
  static const validatePasswordMessage = 'Şifre boş geçilemez';
  // Validator RegExp Strings
  static const authRegExp = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static String validatePasswordLengthMessage(int minLength) {
    return 'Şifre en az $minLength karakter olmalıdır';
  }

  // App Pages Id
  static const splashPageId = 'Splash';
  static const loginPageId = 'Login';
  static const homePageId = 'Home';
}
