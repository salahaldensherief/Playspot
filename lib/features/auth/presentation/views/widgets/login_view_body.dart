import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playspot/core/utils/app_Colors.dart';
import 'package:playspot/core/widgets/custom_text_field.dart';
import 'package:playspot/core/widgets/dont_have_an_account_widget.dart';
import 'package:playspot/features/auth/presentation/views/forget_password_view.dart';
import 'package:playspot/features/auth/presentation/views/widgets/verify_otp_view_body.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/textStyles.dart';
import '../../../../../core/widgets/custom_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenheigth = MediaQuery.of(context).size.height;
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
            'Welcome Back',
            style: TextStyles.regular11.copyWith(fontSize: 24),
          ),
          SizedBox(height: screenheigth * 0.02),
          Text(
            'Let`s log in',
            style: TextStyles.regular11.copyWith(fontSize: 24),
          ),
          SizedBox(height: screenheigth * 0.07),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              children: [
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
                    FontAwesomeIcons.lock,
                    size: 20.sp,
                    color: AppColors.secondaryColor,
                  ),

                  hintText: 'Password',
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(height: screenheigth * 0.001),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ForgetPasswordView.routeName);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyles.regular16.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),

                ),
                SizedBox(height: screenheigth * 0.002),
                CustomButton(
                  onPressed: () {

                  },
                  text: 'Log In',
                  color: AppColors.secondaryColor,
                  colorSide: AppColors.secondaryColor,
                  fontColor: AppColors.primaryColor,
                ),
                SizedBox(height: screenheigth * 0.02),
                DontHaveAnAccountWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
