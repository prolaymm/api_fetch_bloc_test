import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {

  const UserEvent();
}

class LoadApiEvent extends UserEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class NoInternetEvent extends UserEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}