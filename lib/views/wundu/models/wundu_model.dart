class WunduModel {
  final Map<String, double> categoryTotals;

  WunduModel({required this.categoryTotals});

  WunduModel copyWith({Map<String, double>? categoryTotals}) {
    return WunduModel(
      categoryTotals: categoryTotals ?? this.categoryTotals,
    );
  }
}
