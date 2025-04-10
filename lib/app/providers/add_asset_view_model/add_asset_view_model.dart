import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/core/widgets/navigation_helper/navigation_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddAssetViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String? selectedAssetType;
  bool showPurchaseDateError = false;
  int quantity = 1;
  double? purchasePrice;
  DateTime? purchaseDate;

  Future<void> addAssetToFirestore() async {
    try {
      final assetData = {
        AppTexts.assetType: selectedAssetType,
        AppTexts.quantityAddAsset: quantity,
        if (purchasePrice != null) AppTexts.purchasePrice: purchasePrice,
        if (purchaseDate != null)
          AppTexts.purchaseDateAddAsset: purchaseDate?.toIso8601String(),
      };
      await FirebaseFirestore.instance
          .collection(AppTexts.assets)
          .add(assetData);
      debugPrint('Varlık eklendi');
    } catch (e) {
      debugPrint('Varlık eklenirken hata oluştu: $e');
    }
  }

  void resetForm() {
    selectedAssetType = null;
    showPurchaseDateError = false;
    quantity = 1;
    purchasePrice = null;
    purchaseDate = null;
    notifyListeners();
  }

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      purchaseDate = picked;
      showPurchaseDateError = false;
      notifyListeners();
      debugPrint('tarih seçildi');
    }
  }

  void incrementQuantity() {
    quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }

  void submitForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (purchaseDate == null) {
        showPurchaseDateError = true;
        notifyListeners();
        return;
      }

      await addAssetToFirestore();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text(AppTexts.assetAdded)));
      Navigation.ofPop();
    } else {
      showPurchaseDateError = purchaseDate == null;
      notifyListeners();
    }
  }
}
