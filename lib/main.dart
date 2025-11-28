import 'package:event_manager/UI/home_screen.dart';
import 'package:event_manager/UI/splash_screen/splash_screen.dart';
import 'package:event_manager/bloC/splash/bloc/splash_bloc.dart';
import 'package:event_manager/data/provider/remote/user_api.dart';
import 'package:event_manager/data/repositories/user_repository.dart';
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
        RepositoryProvider<UserRepository>(create: (context) => UserRepository(context.read<UserAPI>())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SplashBloc>(create: (context) => SplashBloc(context.read<UserRepository>())),
        ],
        child: MaterialApp(
          navigatorKey: NavigationService.navigatorKey,
          title: 'Flutter Demo',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/home': (context) => const HomeScreen(),
          },
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: SplashScreen(),
        ),
      ),
    );
  }
}