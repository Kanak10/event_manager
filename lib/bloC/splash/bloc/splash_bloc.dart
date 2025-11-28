import 'package:bloc/bloc.dart';
import 'package:event_manager/data/repositories/user_repository.dart';
import 'package:event_manager/utils/connection_status_singleton.dart';
import 'package:flutter/foundation.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final connectionStatus = ConnectionStatusSingleton.instance;
  final loadFailed = true;

  SplashBloc(UserRepository read) : super(SplashInitial()) {
    connectionStatus.initialize();
    connectionStatus.myStream.listen((event) {
      splashLoad();
    });
    on<SplashEvent>((event, emit) {});
    on<CheckUserAuthenticationEvent>(checkUserAuthentication);
  }

  void splashLoad() async {
    if (loadFailed && connectionStatus.hasConnection) {
      try {
        read<UserRepository>();

    }
  }

  void checkUserAuthentication(CheckUserAuthenticationEvent event, Emitter<SplashState> emit) {
    // Check wheater user is already logged in or not
    
    // If logged in then redirect to home page
    // Else show splash details
  }
}
