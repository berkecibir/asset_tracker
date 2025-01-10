import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketManager {
  final String url =
      "wss://socket.haremaltin.com/socket.io/?EIO=4&transport=websocket";
  late WebSocketChannel _channel;

  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _channel.sink.add('40');
  }

  Stream<dynamic> listen() {
    return _channel.stream.map(
      (event) {
        if (event is String) {
          return jsonDecode(event);
        }
        return null;
      },
    );
  }

  void send(String message) {
    _channel.sink.add(message);
  }

  void disconnect() {
    _channel.sink.close();
  }
}
