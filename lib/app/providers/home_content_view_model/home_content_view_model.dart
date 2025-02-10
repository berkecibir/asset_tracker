import 'package:asset_tracker/app/core/enum/asset_type_enum.dart';
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

  final int _minimumFilterLength = 3;

  set filterQuery(String value) {
    _filterQuery = value;
    notifyListeners();
  }

  List<AssetsModel> get filteredAssets {
    if (_filterQuery.length < _minimumFilterLength) {
      return assets
          .where((element) => element.assetType != AssetType.unknown)
          .toList();
    }

    final filtered = assets.where((asset) {
      final query = _filterQuery.toLowerCase();
      final displayMatch = asset.displayName.toLowerCase().contains(query);
      final isKnown = asset.assetType == AssetType.unknown;
      return displayMatch && !isKnown;
    }).toList();

    return filtered;
  }

  void connectToSocket() {
    final socketUrl = dotenv.env[AppTexts.socketUrl] ?? '';
    _webSocketService.connect(socketUrl);
    _webSocketService.stream.listen(
      (event) async {
        try {
          {
            if (event.startsWith(AppTexts.startsWith0)) {
              _webSocketService.sendMessage(AppTexts.startsWith0);
            } else if (event.startsWith(AppTexts.startsWith42)) {
              final jsonData = event.substring(2);
              final parsedAssets =
                  await _assetsRepository.parseAssets(jsonData);
              assets = _updateAssetList([...assets], parsedAssets);
              notifyListeners();
            }
          }
        } on Exception catch (e) {
          throw WebsocketException('${AppTexts.errorParsingWebsocket} $e');
        }
      },
      onDone: () {
        _webSocketService.sendMessage(AppTexts.starsWith40);
      },
    );
  }

  List<AssetsModel> _updateAssetList(
    List<AssetsModel> currentAssets,
    List<AssetsModel> updateAssets,
  ) {
    final assetMap = {for (var asset in currentAssets) asset.name: asset};

    for (var updateAssets in updateAssets) {
      if (assetMap.containsKey(updateAssets.name)) {
        assetMap[updateAssets.name] = updateAssets;
      } else {
        assetMap[updateAssets.name] = updateAssets;
      }
    }
    return assetMap.values.toList();
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
