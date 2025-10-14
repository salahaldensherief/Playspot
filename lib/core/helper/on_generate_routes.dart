import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/new_password_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/auth/presentation/views/widgets/verify_otp_view_body.dart';
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
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => SignupView());
      case ForgetPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => ForgetPasswordView());
      case VerifyOtpView.routeName:
      return MaterialPageRoute(builder: (context) => VerifyOtpView());
      case NewPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => NewPasswordView());

    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
