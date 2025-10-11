import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_Colors.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();

}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Image.asset(AssetsData.logo, width: 100.w),),
          Text('PlaySpot', style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 30.sp,
          )

          ),
        ],
      ),
    );
  }

    void excuteNavigation() async {
//   // bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
//   // String? token = Prefs.getString('auth_token');
//
      Future.delayed(const Duration(seconds: 3), () {
//     if (!isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, OnboardingView.routeName);
//     } else if (token != null && token.isNotEmpty) {
//       Navigator.pushReplacementNamed(context, BottomNavBar.routeName);
//     } else {
//       Navigator.pushReplacementNamed(context, LoginView.routeName);
      }
      );
    }
}