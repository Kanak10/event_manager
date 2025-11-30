import 'package:event_manager/UI/screens/home_screen.dart';
import 'package:event_manager/UI/screens/splash_screen/local_widget/splash_non_auth_screen.dart';
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
  @override
  void initState(){
    super.initState();
    context.read<SplashBloc>().add(SplashStartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      bloc: context.read<SplashBloc>(),
      listener: (context, state) {
        if (state is SplashAuthenticatedState) {
          if (state.isLoggedIn) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()),  (Route<dynamic> route) => false);
          } else {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashNonAuthScreen()),  (Route<dynamic> route) => false);
          }
        }
        setState(() {});
      },
      builder: (context, state) {
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
          default:
            return SizedBox();
        }
      }
    );
  }
}