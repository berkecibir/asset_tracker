import 'package:asset_tracker/app/data/models/assets/assets_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../data/repository/assets/websokcet_repository.dart';
import '../../data/repository/assets/websocket_service.dart';

class HomeViewModel extends ChangeNotifier {
  final IWebSocketService _webSocketService;
  final IAssetsRepository _assetsRepository;

  HomeViewModel(this._webSocketService, this._assetsRepository);

  List<AssetsModel> assets = [];

  void connectToSocket() {
    final socketUrl = dotenv.env['SOCKET_URL'] ?? '';
    _webSocketService.connect(socketUrl);
    _webSocketService.stream.listen(
      (event) async {
        try {
          if (event.startsWith('42[')) {
            final jsonData = event.substring(2);
            final parsedAssets = await _assetsRepository.parseAssets(jsonData);
            assets = parsedAssets;
            notifyListeners();
          }
        } catch (e) {
          debugPrint('WebSocket verisi işlenirken hata: $e');
        }
      },
    );
  }

  void fetchData() {
    _webSocketService.sendMessage('40');
  }

  void disconnectFromSocket() {
    _webSocketService.closeConnection();
  }
}
