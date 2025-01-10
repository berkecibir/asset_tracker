abstract class WebSocketService {
  Stream<String> get stream;

  void connect(String url);
  void sendMessage(String message);
  void closeConnection();
}
