import 'package:bloc_api_handling/bloc/user_events.dart';
import 'package:bloc_api_handling/bloc/user_state.dart';
import 'package:bloc_api_handling/core/repo/service.dart';
import 'package:bloc_api_handling/core/service/connectivity_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Service _service;
  final ConnectivityService _connectivityService;

  UserBloc(this._service, this._connectivityService)
      : super(UserLoadingState()) {
    _connectivityService.connctivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print('no internet');
        add(NoInternetEvent());
      } else {
        print('yes internet');
        add(LoadApiEvent());
      }
    });

    on<LoadApiEvent>((event, emit) async {
      emit(UserLoadingState());

      final activity = await _service.getAllUser();
      emit(UserLoadedState(userName: activity[0].name, zipCode: activity[0].address.zipcode, email: activity[0].email));
    });

    on<NoInternetEvent>((event, emit) async{

      emit(UserInternetState());

    });
  }
}
