import 'package:event_manager/UI/screens/home_screen.dart';
import 'package:event_manager/UI/screens/auth_screen/auth_screen.dart';
import 'package:event_manager/UI/screens/splash_screen/splash_screen.dart';
import 'package:event_manager/bloC/auth/bloc/auth_bloc.dart';
import 'package:event_manager/bloC/home/bloc/home_bloc.dart';
import 'package:event_manager/bloC/splash/bloc/splash_bloc.dart';
import 'package:event_manager/data/provider/remote/auth_api.dart';
import 'package:event_manager/data/provider/remote/user_api.dart';
import 'package:event_manager/data/repositories/auth_repository.dart';
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
        RepositoryProvider<AuthApi>(create: (_) => AuthApi()),
        RepositoryProvider<AuthRepository>(create: (context) => AuthRepository(authApi: AuthApi()))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SplashBloc>(create: (context) => SplashBloc(context.read<UserRepository>(), context.read<AuthTokenRepository>())),
          BlocProvider<AuthBloc>(create: (context) => AuthBloc(context.read<AuthRepository>())),
          BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        ],
        child: MaterialApp(
          navigatorKey: NavigationService.navigatorKey,
          title: 'Flutter Demo',
          initialRoute: '/',
          theme: appThemeData,
          routes: {
            '/': (context) => const SplashScreen(),
            '/home': (context) => const HomeScreen(),
            '/auth': (context) => const AuthenticationScreen()
          },
          // home: SplashScreen(),
        ),
      ),
    );
  }
}