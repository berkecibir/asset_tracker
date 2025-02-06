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
  String _filterQuery = '';

  TextEditingController? editingController;

  String get filterQuery => _filterQuery;

  set filterQuery(String value) {
    _filterQuery = value;
    notifyListeners();
  }

  List<AssetsModel> get filteredAssets {
    debugPrint("Filtreleme Çalıştı: $_filterQuery");
    debugPrint("Mevcut Asset Sayısı: ${assets.length}");

    for (var asset in assets) {
      debugPrint(
          "Asset Name: ${asset.name}, Display Name: ${asset.displayName}"); // yapılan aramalar
    }

    if (_filterQuery.isEmpty) {
      debugPrint("Tüm verileri gösteriyorum..."); // assetlerin hepsi
      return assets;
    }

    final filtered = assets.where((asset) {
      final query = _filterQuery.toLowerCase();
      final nameMatch = asset.name.toLowerCase().contains(query);
      final displayMatch = asset.displayName.toLowerCase().contains(query);
      return nameMatch || displayMatch;
    }).toList();

    debugPrint("Filtre Sonrası Kalan Öğeler: ${filtered.length}");
    return filtered;
  }

/*   List<AssetsModel> get filteredAssets {
    if (_filterQuery.isEmpty) {
      return assets;
    }
    return assets.where((asset) {
      return asset.displayName
              .toLowerCase()
              .contains(_filterQuery.toLowerCase()) ||
          asset.name.toLowerCase().contains(_filterQuery.toLowerCase());
    }).toList();
  } */

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
            notifyListeners();
          }
        } on Exception catch (e) {
          throw WebsocketException('${AppTexts.errorParsingWebsocket} $e');
        }
      },
    );
  }

  void updateEditingController(TextEditingController controller) {
    editingController = controller;
    editingController?.addListener(() {
      filterQuery = editingController?.text ?? '';
    });
  }

  void updateAssets(List<AssetsModel> newAssets) {
    assets = newAssets;
    notifyListeners();
  }

  void fetchData() {
    _webSocketService.sendMessage(AppTexts.starsWith40);
  }

  void disconnectFromSocket() {
    _webSocketService.closeConnection();
  }
}
