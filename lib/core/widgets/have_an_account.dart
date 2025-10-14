// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../utils/app_colors.dart';
import '../utils/textStyles.dart';

// Project imports:

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Already Have Account?  ',
            style: TextStyle(color: Colors.black),
          ),

          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, LoginView.routeName);
              },
            text: 'Login',
            style: TextStyles.medium15.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
