part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}

class SplashStartEvent extends SplashEvent {}

class CheckUserAuthenticationEvent extends SplashEvent {}