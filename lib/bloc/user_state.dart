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

 final String userName;
final String email;
 final String zipCode;

 UserLoadedState({required this.userName, required this.email, required this.zipCode});

  @override
  // TODO: implement props
  List<Object?> get props => [];


}