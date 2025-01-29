import 'package:asset_tracker/app/core/exception/websocket_exception.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/data/models/assets/assets_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../data/repository/assets/websokcet_repository.dart';
import '../../data/repository/assets/websocket_service.dart';

class HomeContentViewModel extends ChangeNotifier {
  final IWebSocketService _webSocketService;
  final IAssetsRepository _assetsRepository;

  HomeContentViewModel(this._webSocketService, this._assetsRepository);

  List<AssetsModel> assets = [];
  List<AssetsModel> _filteredAssets = [];

  List<AssetsModel> get displayedAssets =>
      _filteredAssets.isNotEmpty ? _filteredAssets : assets;

  void connectToSocket() {
    final socketUrl = dotenv.env[AppTexts.socketUrl] ?? '';
    _webSocketService.connect(socketUrl);
    _webSocketService.stream.listen(
      (event) async {
        try {
          if (event.startsWith(AppTexts.startsWith42)) {
            final jsonData = event.substring(2);
            final parsedAssets = await _assetsRepository.parseAssets(jsonData);
            assets = parsedAssets;
            _filteredAssets.clear();
            notifyListeners();
          }
        } on Exception catch (e) {
          throw WebsocketException('${AppTexts.errorParsingWebsocket} $e');
        }
      },
    );
  }

  void filterAssets(String query) {
    if (query.isEmpty) {
      _filteredAssets.clear();
    } else {
      _filteredAssets = assets.where((asset) {
        return asset.displayName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void updateAssets(List<AssetsModel> newAssets) {
    assets = newAssets;
    _filteredAssets.clear();
    notifyListeners();
  }

  void fetchData() {
    _webSocketService.sendMessage(AppTexts.starsWith40);
  }

  void disconnectFromSocket() {
    _webSocketService.closeConnection();
  }
}
