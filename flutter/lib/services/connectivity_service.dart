import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  /// Singleton instance
  static final ConnectivityService _instance = ConnectivityService._internal();

  static late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  static final _connectivity = Connectivity();
  static final _connectivityController = StreamController<bool>.broadcast();

  /// Stream to listen to internet connectivity
  static Stream<bool> get connectivityStream => _connectivityController.stream;

  static void init() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.asBroadcastStream().listen((event) {
      bool isConnected = event.any((result) => result != ConnectivityResult.none);
      _connectivityController.add(isConnected);
    },);
    print("intialized connectivity");
  }

  factory ConnectivityService() => _instance;

  /// Dispose the stream when no longer needed
  void dispose() {
    _connectivitySubscription.cancel();
    _connectivityController.close();
  }

  ConnectivityService._internal();
}
