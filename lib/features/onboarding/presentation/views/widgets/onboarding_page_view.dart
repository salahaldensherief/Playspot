import 'package:flutter/material.dart';
import 'package:playspot/features/onboarding/presentation/views/widgets/page_view_item.dart';

import '../../../../../core/utils/assets_data.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        const PageViewItem(
          image: AssetsData.onboarding1,
          subtitle:
              "Book your spot at the nearest PlayStation cyber in seconds and enjoy gaming with no waiting.",
          title: 'Play Anytime, Anywhere!',
        ),
        const PageViewItem(
          image: AssetsData.onboarding2,
          subtitle:
              "Book your spot at the nearest PlayStation cyber in seconds and enjoy gaming with no waiting.",
          title: 'Book in One\n Tap',
        ),
        const PageViewItem(
          image: AssetsData.onboarding3,
          subtitle:
              "Invite your friends, choose your favorite game, and jump into the challenge together.",
          title: 'Team Up & Have Fun!',
        ),
      ],
    );
  }
}
