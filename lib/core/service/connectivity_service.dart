import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final _connectivity = Connectivity();

  final connctivityStream = StreamController<ConnectivityResult>();

  ConnectivityService() {

    print("internet checkking");
    _connectivity.onConnectivityChanged.listen((event) {
      connctivityStream.add(event);
    });
  }
}
