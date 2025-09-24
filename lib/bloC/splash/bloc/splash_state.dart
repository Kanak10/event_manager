part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashAuthenticatedState extends SplashState {}

class SplashUnauthenticatedState extends SplashState {}