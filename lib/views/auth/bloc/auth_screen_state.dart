part of 'auth_screen_bloc.dart';

// ignore: must_be_immutable
class AuthScreenState extends Equatable {
  AuthScreenState({this.authScreenModelObj});

  AuthScreenModel? authScreenModelObj;

  @override
  List<Object?> get props => [authScreenModelObj];
  AuthScreenState copyWith({AuthScreenModel? authScreenModelObj}) {
    return AuthScreenState(
        authScreenModelObj: authScreenModelObj ?? this.authScreenModelObj);
  }
}
