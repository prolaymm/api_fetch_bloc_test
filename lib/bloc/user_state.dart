import 'package:bloc_api_handling/core/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable{

  const UserState();
}

class UserLoadingState extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UserInternetState extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UserLoadedState extends UserState {
/*
 final String userName;
final String email;
 final String zipCode;*/

 final List<UserModel> mUserList;

 const UserLoadedState({required this.mUserList});

  @override
  // TODO: implement props
  List<Object?> get props => [];


}