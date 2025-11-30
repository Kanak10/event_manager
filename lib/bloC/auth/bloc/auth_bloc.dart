import 'package:event_manager/data/repositories/auth_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthRepository authRepository) : super(AuthInitialState()) {
    on<SigninEvent>((event, emit) async {
      emit(AuthLoadingState());

      await Future.delayed(const Duration(seconds: 1));
      debugPrint("event.email.isEmpty: ${event.email}");
      debugPrint("event.password.isEmpty: ${event.password}");
      debugPrint("event.email.isEmpty: ${event.email.isEmpty}");
      debugPrint("event.password.isEmpty: ${event.password.isEmpty}");
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(AuthErrorState("Email and password cannot be empty"));


      } else {
        emit(AuthSuccessState(message: "Login successful"));
        debugPrint("Login successful");
        final result = await authRepository.signIn(event.email, event.password);

        debugPrint("result: ${result}");

        debugPrint(result);
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoadingState());

      await Future.delayed(const Duration(seconds: 1));

      if (event.password != event.confirmPassword) {
        emit(AuthErrorState("Passwords do not match"));
      } else if (event.email.isEmpty ||
          event.firstName.isEmpty ||
          event.lastName.isEmpty) {
        emit(AuthErrorState("All fields are required"));
      } else {
        emit(AuthSuccessState(message: "Signup successful"));
      }
    });

    on<GoogleSignInEvent>((event, emit) async {
      debugPrint("in GoogleSignInEvent");
      emit(AuthLoadingState());
      try {
        final result = await authRepository.googleAuth();

        debugPrint("result: ${result}");

        debugPrint(result);
      } catch (e) {
        debugPrint(e.toString());
      }
      emit(AuthSuccessState(message: "Google Sign-in successful"));
    });
  }
}
