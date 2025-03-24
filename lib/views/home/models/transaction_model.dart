import 'dart:ui';

class TransactionModel {
  final String id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final String type; // 'transfer', 'payment', 'withdrawal', etc.
  final Color backgroundColor;
  final String? iconPath;

  TransactionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.type,
    required this.backgroundColor,
    this.iconPath,
  });

  // Método para converter de/para JSON se necessário
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      amount: json['amount'].toDouble(),
      date: DateTime.parse(json['date']),
      type: json['type'],
      backgroundColor: Color(json['backgroundColor']),
      iconPath: json['iconPath'],
    );
  }
}
