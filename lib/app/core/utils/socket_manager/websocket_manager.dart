import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketManager {
  late final String _url;
  late WebSocketChannel _channel;
  webSocketManager() {
    _url = dotenv.env['SOCKET_URL'] ?? '';
    if (_url.isEmpty) {
      throw Exception("WebSocket URL is not defined in .env file.");
    }
  }

  void connect() {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(_url));
      _channel.sink.add('40');
    } catch (e) {
      debugPrint('Error connecting to WebSocket: $e');
    }
  }

  Stream<dynamic> listen() {
    return _channel.stream.map((event) {
      try {
        if (event is String) {
          if (event.startsWith('42[')) {
            return jsonDecode(event.substring(2));
          }
          return event;
        }
      } catch (e) {
        debugPrint("Error processing WebSocket event: $e");
      }
      return null;
    });
  }

  void send(String message) {
    try {
      _channel.sink.add(message);
    } catch (e) {
      debugPrint("Error sending message: $e");
    }
  }

  void disconnect() {
    try {
      _channel.sink.close();
      debugPrint("WebSocket disconnected.");
    } catch (e) {
      debugPrint("Error disconnecting WebSocket: $e");
    }
  }
}
