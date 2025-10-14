import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playspot/core/utils/app_Colors.dart';
import 'package:playspot/core/widgets/custom_app_bar.dart';
import 'package:playspot/core/widgets/custom_button.dart';
import 'package:playspot/core/widgets/custom_text_field.dart';

import '../../../../../core/utils/textStyles.dart';

class NewPasswordViewBody extends StatelessWidget {
  const NewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        showElevation: false,
        showBack: true,
        title: 'Create New Password',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.04),

            Text(
              'Set your new password so you can login and access to your account',
              style: TextStyles.regular16,
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomTextFormField(
              prefixIcon: Icon(
                FontAwesomeIcons.lock,
                color: AppColors.secondaryColor,
              ),
              suffixIcon: Icon(
                FontAwesomeIcons.eyeSlash,
                color: AppColors.grayColor,
              ),
              hintText: 'Enter your new password',
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomTextFormField(
              suffixIcon: Icon(
                FontAwesomeIcons.eyeSlash,
                color: AppColors.grayColor,
              ),

              prefixIcon: Icon(
                FontAwesomeIcons.lock,
                color: AppColors.secondaryColor,
              ),

              hintText: 'Confirm your password',
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomButton(
              onPressed: () {},
              text: 'Confirm Password',
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
