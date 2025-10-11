import 'package:flutter/material.dart';
import 'package:playspot/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
static const routeName = 'splashView';
  @override
  Widget build(BuildContext context) {
    return SplashViewBody();
  }
}
