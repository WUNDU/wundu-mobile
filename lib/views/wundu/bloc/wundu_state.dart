// wundu_state.dart
part of 'wundu_bloc.dart';


class WunduState extends Equatable {
  final WunduModel? wunduModelObj;

  const WunduState({this.wunduModelObj});

  WunduState copyWith({WunduModel? wunduModelObj}) {
    return WunduState(
      wunduModelObj: wunduModelObj ?? this.wunduModelObj,
    );
  }
  
  @override
  List<Object?> get props => [];
}

class WunduInitialState extends WunduState {
  const WunduInitialState() : super();
}