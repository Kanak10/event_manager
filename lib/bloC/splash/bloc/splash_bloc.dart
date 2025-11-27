import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {});
    on<CheckUserAuthenticationEvent>(checkUserAuthentication);
  }

  void checkUserAuthentication(CheckUserAuthenticationEvent event, Emitter<SplashState> emit) {
    // Check wheater user is already logged in or not
    
    // If logged in then redirect to home page
    // Else show splash details
  }
}
