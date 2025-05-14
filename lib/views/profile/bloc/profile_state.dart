part of 'profile_bloc.dart';

// ignore: must_be_immutable
class ProfileState extends Equatable {
  ProfileState({this.profileModelObj});

  ProfileModel? profileModelObj;

  @override
  List<Object?> get props => [profileModelObj];
  ProfileState copyWith({
    ProfileModel? profileModelObj,
  }) {
    return ProfileState(
      profileModelObj: profileModelObj ?? this.profileModelObj,
    );
  }
}
