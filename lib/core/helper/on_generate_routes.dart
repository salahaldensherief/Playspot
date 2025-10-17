import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playspot/core/services/api/dio_consumer.dart';
import 'package:playspot/features/auth/data/repos/auth_repo_impl.dart';
import 'package:playspot/features/auth/presentation/cubits/verifyOtp/verify_otp_cubit.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/new_password_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/auth/presentation/views/widgets/verify_otp_view_body.dart';
import '../../features/layout/presentation/views/layout_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
    // 🟣 Splash
      case SplashView.routeName:
        return _fadeRoute(const SplashView(), settings);

    // 🩵 Onboarding
      case OnboardingView.routeName:
        return _slideFromRight(const OnboardingView(), settings);

    // 🧡 Login
      case LoginView.routeName:
        return _slideFromBottom(const LoginView(), settings);

    // 💚 Signup
      case SignupView.routeName:
        return _slideFromRight(const SignupView(), settings);

    // 💜 Forget Password
      case ForgetPasswordView.routeName:
        return _fadeRoute(const ForgetPasswordView(), settings);

    // 💛 Verify OTP (مع Bloc)
      case VerifyOtpView.routeName:
        return _slideFromRight(
          BlocProvider(
            create: (context) =>
                VerifyOtpCubit(AuthRepoImpl(DioConsumer(dio: Dio()))),
            child: const VerifyOtpView(),
          ),
          settings,
        );

    // 🔵 New Password
      case NewPasswordView.routeName:
        return _fadeRoute(const NewPasswordView(), settings);

    // 🔴 Layout
      case LayoutView.routeName:
        return _slideFromBottom(const LayoutView(), settings);

    // 🟥 Default
      default:
        return _errorRoute();
    }
  }

  // ⚙️ Fade Transition
  static PageRouteBuilder _fadeRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  // ⚙️ Slide From Right
  static PageRouteBuilder _slideFromRight(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  // ⚙️ Slide From Bottom
  static PageRouteBuilder _slideFromBottom(
      Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  // ⚙️ Error Route
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            '404 - Page Not Found',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
