import 'dart:developer';

import 'package:event_manager/UI/home_screen.dart';
import 'package:event_manager/UI/splash_screen/local_widget/splash_non_auth_screen.dart';
import 'package:event_manager/bloC/splash/bloc/splash_bloc.dart';
import 'package:event_manager/utils/image_const/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashBloc splashBloc = SplashBloc();
  @override
  void initState(){
    super.initState();
    splashBloc.add(CheckUserAuthenticationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      bloc: splashBloc,
      listener: (context, state) {
        print("SplashAuthenticatedState:: ${state}");
        if (state is SplashAuthenticatedState) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()),  (Route<dynamic> route) => false);
        }
      },
      builder: (context, state) {
        print("state.runtimeType:: ${state.runtimeType}");
        log("log state.runtimeType: ${state.runtimeType}");
        switch(state.runtimeType) {
          case SplashLoadingState:
            return Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(ImageConstant.splashBackgroundImage))
                ),
              ),
            );
          case SplashNonAuthScreen:
            return SplashNonAuthScreen();
          default:
            return Container(color: Colors.blue);

        }
      }
    );
  }
}