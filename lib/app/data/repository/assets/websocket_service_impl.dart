import 'dart:async';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'websocket_service.dart';

class WebSocketService implements IWebSocketService {
  late WebSocketChannel _channel;
  StreamController<String>? _controller;

  @override
  Stream<String> get stream {
    if (_controller == null || _controller!.isClosed) {
      _controller = StreamController<String>.broadcast();
    }
    return _controller!.stream;
  }

  @override
  void connect(String url) {
    try {
      final socketUrl = dotenv.env[AppTexts.socketUrl] ?? '';
      if (socketUrl.isEmpty) {
        debugPrint('Bağlanılmaya çalışılan URL: $url');
      }
      _channel = WebSocketChannel.connect(Uri.parse(url));
      _channel.stream.listen(
        (data) {
          debugPrint("WebSocket'ten gelen veri: $data");
          _controller?.add(data);
        },
        onDone: () => _controller?.close(),
        onError: (error) {
          _controller?.addError(error);
          debugPrint("WebSocket bağlantısı hatası: $error");
        },
      );
    } catch (e) {
      debugPrint('WebSocket bağlantısı başlatılamadı: $e');
    }
  }

  @override
  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  @override
  void closeConnection() {
    _channel.sink.close();
    _controller?.close();
    _controller = null;
  }
}
