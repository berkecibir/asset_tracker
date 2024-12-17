class FirebaseauthException implements Exception {
  final String message;

  FirebaseauthException(this.message);
  @override
  String toString() {
    return 'FirebaseAuthException: $message';
  }
}
