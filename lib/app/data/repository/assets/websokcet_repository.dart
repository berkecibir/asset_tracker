import 'dart:convert';
import '../../models/assets/assets_model.dart';

abstract class IAssetsRepository {
  Future<List<AssetsModel>> parseAssets(String rawData);
}

class AssetsRepository implements IAssetsRepository {
  @override
  Future<List<AssetsModel>> parseAssets(String rawData) async {
    final decodedData = jsonDecode(rawData) as List;
    if (decodedData.length > 1 &&
        decodedData[0] == 'price_changed' &&
        decodedData[1] is Map) {
      final data = decodedData[1]['data'] as Map<String, dynamic>;
      return data.entries.map<AssetsModel>((entry) {
        return AssetsModel.fromJson(entry.value);
      }).toList();
    }
    return [];
  }
}
