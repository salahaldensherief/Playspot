import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';


Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());
    // case BottomNavBar.routeName:
    //   return MaterialPageRoute(builder: (context) => BottomNavBar());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnboardingView());
    // case HomeView.routeName:
    //   return MaterialPageRoute(builder: (context) => HomeView());
    // case LoginView.routeName:
    //   return MaterialPageRoute(
    //     builder: (context) => BlocProvider(
    //       create: (context) => di.sl<SignInCubit>(),
    //       child: LoginView(),
    //     ),
    //   );
    // case SignUpView.routeName:
    //   return MaterialPageRoute(
    //     builder: (context) => BlocProvider(
    //       create: (context) => di.sl<SignUpCubit>(),
    //       child: SignUpView(),
    //     ),
    //   );


    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
