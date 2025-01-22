import 'dart:async';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'websocket_service.dart';

class WebSocketService implements IWebSocketService {
  late WebSocketChannel _channel;
  final _controller = StreamController<String>();

  @override
  Stream<String> get stream => _controller.stream;

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
          _controller.add(data);
        },
        onDone: () => _controller.close(),
        onError: (error) {
          _controller.addError(error);
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
    _controller.close();
  }
}
/* import 'dart:async';
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
    debugPrint("Bağlanılmaya çalışılan URL: $url");
    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      _channel.stream.listen(
        (data) {
          debugPrint("WebSocket'ten gelen veri: $data");
          _controller.add(data);
        },
        onDone: () {
          debugPrint("WebSocket bağlantısı kapatıldı.");
          _controller.close();
        },
        onError: (error) {
          debugPrint("WebSocket bağlantısı hatası: $error");
          _controller.addError(error);
        },
      );
    } catch (e) {
      debugPrint("WebSocket bağlantısı başlatılamadı: $e");
      _controller.addError(e);
    }
  }

  /* @override
  void connect(String url) {
    debugPrint('$url bağlanmaya çalışıyor');

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
  } */

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
 */