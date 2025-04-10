import 'package:asset_tracker/app/data/repository/user_asset/user_asset_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:asset_tracker/app/data/models/assets/user_asset.dart';
import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';

class FirebaseUserAssetRepository implements UserAssetRepository {
  final FirebaseFirestore _firestore;
  FirebaseUserAssetRepository(this._firestore);

  @override
  Stream<List<UserAsset>> getAssetsStream() {
    return _firestore.collection(AppTexts.assets).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => UserAsset.fromFirestore(doc)).toList());
  }

  @override
  Future<List<UserAsset>> getAllAssets() async {
    final snapshot = await _firestore.collection(AppTexts.assets).get();
    return snapshot.docs.map((doc) => UserAsset.fromFirestore(doc)).toList();
  }

  @override
  Future<void> deleteAsset(String docId) async {
    await _firestore.collection(AppTexts.assets).doc(docId).delete();
  }
}
