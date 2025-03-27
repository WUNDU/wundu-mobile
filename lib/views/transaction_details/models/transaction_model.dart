import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TransactionModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final String type;
  final Color backgroundColor;
  final String? iconPath;
  final ButtonStyle buttonStyle;
  final String cardId;
  final String? category; // Nova propriedade para categoria

  TransactionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.type,
    required this.backgroundColor,
    required this.buttonStyle,
    required this.cardId,
    this.iconPath,
    this.category, // Pode ser null inicialmente
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
      category: json['category'],
    );
  }

  TransactionModel copyWith({String? category}) {
    return TransactionModel(
      id: id,
      title: title,
      description: description,
      amount: amount,
      date: date,
      type: type,
      backgroundColor: backgroundColor,
      iconPath: iconPath,
      buttonStyle: buttonStyle,
      cardId: cardId,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        amount,
        date,
        type,
        backgroundColor,
        iconPath,
        buttonStyle,
        cardId,
        category,
      ];
}
