import 'package:asset_tracker/app/data/models/assets/user_asset.dart';

abstract class UserAssetRepository {
  Stream<List<UserAsset>> getAssetsStream();
  Future<List<UserAsset>> getAllAssets();
  Future<void> deleteAsset(String docId);
}
