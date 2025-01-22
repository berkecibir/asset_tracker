/* import 'dart:convert';
import 'dart:io';
import 'package:asset_tracker/app/core/exception/websocket_exception.dart';
import 'package:asset_tracker/app/core/sizes/app_text_sizes.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketManager {
  late final String _url;
  late WebSocketChannel _channel;
  webSocketManager() {
    _url = dotenv.env[AppTexts.socketUrl] ?? '';
    if (_url.isEmpty) {
      throw WebsocketException(AppTexts.urlIsNotDefined);
    }
  }

  void connect() {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(_url));
      _channel.sink.add(AppTexts.starsWith40);
    } on Exception catch (e) {
      throw WebsocketException('${AppTexts.errorConnectingWebsocket} $e');
    }
  }

  Stream<dynamic> listen() {
    return _channel.stream.map((event) {
      try {
        if (event is String) {
          if (event.startsWith(AppTexts.startsWith42)) {
            return jsonDecode(event.substring(2));
          }
          return event;
        }
      } on FormatException catch (e) {
        WebSocketException('${AppTexts.errorParsingWebsocket} $e');
      }
    }).handleError((error) {
      throw WebSocketException('${AppTexts.stremError} $error');
    });
  }

  void send(String message) {
    try {
      _channel.sink.add(message);
    } on Exception catch (e) {
      throw WebsocketException('${AppTexts.errorSendingMesage} $e');
    }
  }

  void disconnect() {
    try {
      _channel.sink.close();
      debugPrint(AppTexts.websocketDisconnected);
    } on Exception catch (e) {
      throw WebsocketException('${AppTexts.errorDisconnectWebsocket} $e');
    }
  }
}
 */