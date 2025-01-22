class AssetsModel {
  final String name;
  final double price;

  AssetsModel({required this.name, required this.price});

  factory AssetsModel.fromJson(Map<String, dynamic> json) {
    return AssetsModel(
      name: json['code'] ?? 'Bilinmiyor',
      price: _parseToDouble(json['satis']),
    );
  }

  //final price = double.tryParse((json['satis'] as num? ?? 0).toString()) ?? 0.0;

  static double _parseToDouble(dynamic json) {
    final price =
        double.tryParse((json['satis'] as num? ?? 0).toString()) ?? 0.0;
    return price;

    /* if (value == null) return 0.0;
    if (value is String) return double.tryParse(value) ?? 0.0;
    if (value is int || value is double) return value.toDouble();
    return 0.0; */
  }
}
