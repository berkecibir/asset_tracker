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

  // hint text strings

  static const mailHint = 'E-Posta';
  static const passwordHint = 'Şifre';

  // service strings

  static const userNotFound = 'Kullanıcı bulunamadı';
  static const userNotFoundEmail =
      'Bu e-posta adresi ile kullanıcı bulunamadı.';

  static const wrongPassword = 'Yanlış Şifre';
  static const enteredWrongPassword = 'Yanlış şifre girildi.';
  static const errorOccurred = 'Hata meydana geldi:';

  // snackbar message

  static const errorOccurredLogin = 'Giriş yapılırken bir hata oluştu:';
}
