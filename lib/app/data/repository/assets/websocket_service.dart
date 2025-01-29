import 'dart:async';

abstract class IWebSocketService {
  Stream<String> get stream;
  void connect(String url);
  void sendMessage(String message);
  void closeConnection();
}
