import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:playspot/features/splash/presentation/views/splash_view.dart';
import 'core/helper/on_generate_routes.dart';
import 'core/services/shared_preferences_singleton.dart';

void main()async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PlaySpot',
          theme: ThemeData(
            fontFamily: 'ArbutusSlab'
          ),
          initialRoute: SplashView.routeName,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
