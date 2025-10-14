import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:playspot/core/utils/app_Colors.dart';
import 'package:playspot/core/widgets/custom_app_bar.dart';
import 'package:playspot/core/widgets/custom_button.dart';
import 'package:playspot/core/widgets/resend_code_widget.dart';
import 'package:playspot/features/auth/presentation/views/new_password_view.dart';

import '../../../../../core/utils/textStyles.dart';

class VerifyOtpView extends StatefulWidget {
  const VerifyOtpView({super.key});
static const routeName = 'verifyOtpView';
  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenHeigth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        showBack: true,
        showElevation: false,
        title: 'Verify your email',
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height:screenHeigth * 0.08),

            Text(
              'Please enter the 4 digit code that sent to salah@gmail.com',
              style: TextStyles.regular16,
            ),
            SizedBox(height:screenHeigth * 0.07),
            PinCodeTextField(
              cursorColor: AppColors.secondaryColor,
              appContext: context,
              length: 4,
              controller: otpController,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              textStyle: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle,
                fieldHeight: 75,
                fieldWidth: 75,
                activeFillColor: AppColors.grayColor,
                inactiveFillColor: AppColors.grayColor,
                selectedFillColor: AppColors.grayColor,
                activeColor: AppColors.grayColor,
                inactiveColor: AppColors.grayColor,
                selectedColor: AppColors.grayColor,
                borderWidth: 0,
              ),
              enableActiveFill: true,
              onChanged: (value) {},
            ),
            SizedBox(height:screenHeigth * 0.05),

            CustomButton(onPressed: (){
              Navigator.pushNamed(context, NewPasswordView.routeName);
            }, text: 'Verify', color: AppColors.secondaryColor, colorSide: AppColors.secondaryColor, fontColor: AppColors.primaryColor),
            SizedBox(height:screenHeigth * 0.05),
            ResendCodeWidget(

            )

          ],
        ),
      ),
    );
  }
}
