import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playspot/core/widgets/have_an_account.dart';
import 'package:playspot/features/auth/presentation/views/widgets/verify_otp_view_body.dart';

import '../../../../../core/utils/app_Colors.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/textStyles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/dont_have_an_account_widget.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheigth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              height: screenheigth * 0.14,
              AssetsData.blackLogo,
            ),
          ),
          SizedBox(height: screenheigth * 0.02),

          Text(
            'Welcome to playspot ',
            style: TextStyles.regular11.copyWith(fontSize: 24),
          ),
          SizedBox(height: screenheigth * 0.02),
          Text(
            'let`s Sign Up',
            style: TextStyles.regular11.copyWith(fontSize: 24),
          ),
          SizedBox(height: screenheigth * 0.07),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              children: [
                CustomTextFormField(
                  prefixIcon: Icon(
                    FontAwesomeIcons.solidUser,
                    size: 20.sp,
                    color: AppColors.secondaryColor,
                  ),
                  hintText: 'Username',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: screenheigth * 0.02),

                CustomTextFormField(
                  prefixIcon: Icon(
                    FontAwesomeIcons.solidEnvelope,
                    size: 20.sp,
                    color: AppColors.secondaryColor,
                  ),
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: screenheigth * 0.02),

                CustomTextFormField(
                  prefixIcon: Icon(
                    FontAwesomeIcons.phone,
                    size: 20.sp,
                    color: AppColors.secondaryColor,
                  ),
                  hintText: 'Phone Number',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: screenheigth * 0.02),

                CustomTextFormField(
                  prefixIcon: Icon(
                    FontAwesomeIcons.lock,
                    size: 20.sp,
                    color: AppColors.secondaryColor,
                  ),
                  hintText: 'Password',
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(height: screenheigth * 0.02),
                CustomTextFormField(
                  prefixIcon: Icon(
                    FontAwesomeIcons.lock,
                    size: 20.sp,
                    color: AppColors.secondaryColor,
                  ),

                  hintText: 'Confirm password',
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(height: screenheigth * 0.02),
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, VerifyOtpView.routeName);

                  },
                  text: 'Sign Up',
                  color: AppColors.secondaryColor,
                  colorSide: AppColors.secondaryColor,
                  fontColor: AppColors.primaryColor,
                ),
                SizedBox(height: screenheigth * 0.02),
                HaveAnAccountWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
