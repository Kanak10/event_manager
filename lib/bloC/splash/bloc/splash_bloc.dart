import 'package:bloc/bloc.dart';
import 'package:event_manager/data/repositories/local/auth_token_repository.dart';
import 'package:event_manager/data/repositories/user_repository.dart';
import 'package:event_manager/utils/connection_status_singleton.dart';
import 'package:flutter/foundation.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final connectionStatus = ConnectionStatusSingleton.instance;
  bool isLoggedIn = false;
  bool isLoading = true;

  SplashBloc(UserRepository userRepository, AuthTokenRepository authRepository) : super(SplashInitial()) {
    connectionStatus.initialize();
    // connectionStatus.myStream.listen((event) {
      // splashLoad(authRepository, userRepository);
    // });
    on<SplashEvent>((event, emit) {});
    on<SplashStartEvent>((SplashStartEvent event, Emitter<SplashState> emit) async {
      await onStart(event, emit, authRepository, userRepository);
    });
  }

  Future<void> onStart(SplashStartEvent event, Emitter<SplashState> emit, AuthTokenRepository authRepository, UserRepository userRepository) async {
    emit(SplashLoadingState());
    try {
      await authRepository.retriveTokenFromStore();

      if (authRepository.isUserLoggedIn()) {
        await userRepository.fetchUser();

        emit(SplashAuthenticatedState(isLoggedIn: true));
      } else {
        emit(SplashAuthenticatedState(isLoggedIn: false));
      }
    } catch (e) {
      emit(SplashAuthenticatedState(isLoggedIn: false));
    }
  }

  void splashLoad(AuthTokenRepository authRepository, UserRepository userRepository) async {
    // SplashBloc(userRepository, authRepository).add(SplashAuthenticatedEvent());

    if (connectionStatus.hasConnection) {
      // try {
      //   await authRepository.retriveTokenFromStore();
      //   if (authRepository.isUserLoggedIn()) {
      //     final result = await userRepository.fetchUser();
      //     if (result.data != null) {}
      //     isLoggedIn = authRepository.isUserLoggedIn();
      //     isLoading = false;
      //     SplashBloc(userRepository, authRepository).add(SplashAuthenticatedEvent());
      //   } else {
      //     SplashBloc(userRepository, authRepository).add(SplashUnAuthenticatedEvent());
      //   }
      // } catch(e) {
      //   log(e.toString());
      // }
    }
  }
}
