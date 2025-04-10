import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/data/models/assets/user_asset.dart';
import 'package:asset_tracker/app/data/repository/user_asset/user_asset_repository.dart';
import 'package:flutter/material.dart';

class UserAssetViewModel extends ChangeNotifier {
  final UserAssetRepository _repository;

  List<UserAsset> _assets = [];
  List<UserAsset> get assets => _assets;

  Stream<List<UserAsset>> get assetsStream => _repository.getAssetsStream();

  UserAssetViewModel(this._repository) {
    _listenToAssets();
  }

  void _listenToAssets() {
    _repository.getAssetsStream().listen((updatedAssets) {
      _assets = updatedAssets;
      notifyListeners();
    });
  }

  Future<void> loadAllAssets() async {
    _assets = await _repository.getAllAssets();
    notifyListeners();
  }

  Future<void> showDeleteConfirmationDialog(
      BuildContext context, String docId, Function(String) onConfirm) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(AppTexts.deleteConfirmation),
          content: const Text(AppTexts.deleteUserAssetContent),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(AppTexts.no),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm(docId);
              },
              child: const Text(AppTexts.yes),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteAsset(BuildContext context, String docId) async {
    await showDeleteConfirmationDialog(context, docId, (id) async {
      await _repository.deleteAsset(id);
      debugPrint("Varlık silindi: $id");
    });
  }
}
