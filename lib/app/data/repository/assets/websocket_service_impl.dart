import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'websocket_service.dart';

class WebSocketService implements IWebSocketService {
  late WebSocketChannel _channel;
  final _controller = StreamController<String>();

  @override
  Stream<String> get stream => _controller.stream;

  @override
  void connect(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _channel.stream.listen(
      (data) {
        debugPrint("WebSocket'ten gelen veri: $data");
        _controller.add(data);
      },
      onDone: () => _controller.close(),
      onError: (error) {
        _controller.addError(error);
        debugPrint("WebSocket bağlantısı hatası: $error");
      },
    );
  }

  @override
  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  @override
  void closeConnection() {
    _channel.sink.close();
    _controller.close();
  }
}
