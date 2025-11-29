import 'package:event_manager/UI/home_screen.dart';
import 'package:event_manager/UI/login_screen/login_screen.dart';
import 'package:event_manager/UI/splash_screen/splash_screen.dart';
import 'package:event_manager/bloC/splash/bloc/splash_bloc.dart';
import 'package:event_manager/data/provider/remote/user_api.dart';
import 'package:event_manager/data/repositories/local/auth_token_repository.dart';
import 'package:event_manager/data/repositories/user_repository.dart';
import 'package:event_manager/theams/app_theme.dart';
import 'package:event_manager/utils/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserAPI>(create: (_) => UserAPI()),
        RepositoryProvider<UserRepository>(create: (context) => UserRepository(context.read<UserAPI>())),
        RepositoryProvider<AuthTokenRepository>(create: (context) => AuthTokenRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SplashBloc>(create: (context) => SplashBloc(context.read<UserRepository>(), context.read<AuthTokenRepository>())),
        ],
        child: MaterialApp(
          navigatorKey: NavigationService.navigatorKey,
          title: 'Flutter Demo',
          initialRoute: '/',
          theme: appThemeData,
          routes: {
            '/': (context) => const SplashScreen(),
            '/home': (context) => const HomeScreen(),
            '/login': (context) => const LoginScreen()
          },
          // home: SplashScreen(),
        ),
      ),
    );
  }
}