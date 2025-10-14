import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/utils/app_Colors.dart';
import '../../../../auth/presentation/views/login_view.dart';
import 'onboarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        OnBoardingPageView(pageController: pageController),
        Positioned(
          bottom: 50.h,
          left: 50.w,
          right: 24.w,
          child: Column(
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                    width: 40.w,
                    height: 4.h,
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  dotDecoration: DotDecoration(
                    width: 8.w,
                    height: 8.h,
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: height/10,),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    if (currentPage < 2) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacementNamed(context, LoginView.routeName);
                    }
                  },
                  child: Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
