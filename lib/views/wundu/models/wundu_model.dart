class WunduModel {
  final Map<String, double> categoryTotals;
  final String? topCategory;
  final double? topCategoryAmount;

  WunduModel({
    required this.categoryTotals,
    this.topCategory,
    this.topCategoryAmount,
  });

  WunduModel copyWith({
    Map<String, double>? categoryTotals,
    String? topCategory,
    double? topCategoryAmount,
  }) {
    return WunduModel(
      categoryTotals: categoryTotals ?? this.categoryTotals,
      topCategory: topCategory ?? this.topCategory,
      topCategoryAmount: topCategoryAmount ?? this.topCategoryAmount,
    );
  }
}
