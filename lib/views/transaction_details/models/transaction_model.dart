import 'package:flutter/material.dart';

class TransactionModel {
  final String id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final String type;
  final Color backgroundColor;
  final String? iconPath;
  final ButtonStyle buttonStyle;
  final String cardId; // Novo campo para identificar o cartão

  TransactionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.type,
    required this.backgroundColor,
    required this.buttonStyle,
    required this.cardId, // Campo obrigatório
    this.iconPath,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      amount: json['amount'].toDouble(),
      date: DateTime.parse(json['date']),
      type: json['type'],
      buttonStyle: json['buttonStyle'],
      backgroundColor: Color(json['backgroundColor']),
      iconPath: json['iconPath'],
      cardId: json['cardId'],
    );
  }
}
