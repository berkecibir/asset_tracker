class WebsocketException implements Exception {
  final String message;

  WebsocketException(this.message);

  @override
  String toString() {
    return 'WebsocketException: $message';
  }
}
