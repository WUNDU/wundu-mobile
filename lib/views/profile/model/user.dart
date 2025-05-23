import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String? profileImageUrl;

  const User({
    required this.id,
    required this.name,
    this.profileImageUrl,
  });

  @override
  List<Object?> get props => [id, name, profileImageUrl];
}
