import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:playspot/core/utils/app_Colors.dart';
import 'package:playspot/core/widgets/custom_app_bar.dart';
import 'package:playspot/core/widgets/custom_button.dart';
import 'package:playspot/core/widgets/custom_text_field.dart';
import 'package:playspot/features/auth/presentation/views/widgets/verify_otp_view_body.dart';

import '../../../../../core/utils/textStyles.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        showElevation: false,
        showBack: true,
        title: 'Forget Password',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 24.0.w),
        child: Column(
          children: [
            SizedBox(height: screenHeigth * 0.07),
            Text(
              'Please enter your email to reset your password',

              style: TextStyles.regular16,
            ),
            SizedBox(height: screenHeigth * 0.02),

            CustomTextFormField(
              hintText: 'Enter your phone number',
              textInputType: TextInputType.phone,
            ),
            SizedBox(height: screenHeigth * 0.02),

            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, VerifyOtpView.routeName);
              },
              text: 'Next',
              color: AppColors.secondaryColor,
              colorSide: AppColors.secondaryColor,
              fontColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
