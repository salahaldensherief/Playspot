// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/signup_view.dart';
import '../utils/app_colors.dart';
import '../utils/textStyles.dart';

// Project imports:


class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'If you don’t receive code?  ',

          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap= (){
              Navigator.pushNamed(context, SignupView.routeName);
            },
            text: 'Resend code',style: TextStyles.medium15.copyWith(
              color: AppColors.secondaryColor
          ),),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
