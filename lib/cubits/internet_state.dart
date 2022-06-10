import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState {
  inital,
  lost,
  gained,
}

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  InternetCubit() : super(InternetState.inital) {
    connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (result) {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          emit(InternetState.gained);
        } else {
          emit(InternetState.lost);
        }
      },
    );
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}