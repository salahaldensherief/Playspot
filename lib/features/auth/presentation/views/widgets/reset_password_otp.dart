import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:playspot/core/utils/app_Colors.dart';
import 'package:playspot/core/utils/textStyles.dart';
import 'package:playspot/core/widgets/custom_app_bar.dart';
import 'package:playspot/core/widgets/custom_button.dart';
import 'package:playspot/core/widgets/resend_code_widget.dart';
import 'package:playspot/features/auth/presentation/cubits/resetPassword/reset_password_cubit.dart';
import 'package:playspot/features/auth/presentation/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordOtp extends StatefulWidget {
  const ResetPasswordOtp({super.key});
  static const routeName = 'verifyOtpView';

  @override
  State<ResetPasswordOtp> createState() => _ResetPasswordOtpState();
}

class _ResetPasswordOtpState extends State<ResetPasswordOtp> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        showBack: true,
        showElevation: false,
        title: 'Verify your email',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        // child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        //   listener: (context, state) async {
        //     if (!mounted) return;
        //     if (state is ResetPasswordSuccess) {
        //       Navigator.pushReplacementNamed(context, LoginView.routeName);
        //     } else if (state is ResetPasswordFailure) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(
        //           content: Text(state.message),
        //           backgroundColor: Colors.red,
        //         ),
        //       );
        //     }
        //   },
        //   builder: (context, state) {
        //     return Column(
        //       children: [
        //         SizedBox(height: screenHeight * 0.08),
        //         Text(
        //           'Please enter the 4 digit code that was sent to your email.',
        //           style: TextStyles.regular16,
        //           textAlign: TextAlign.center,
        //         ),
        //         SizedBox(height: screenHeight * 0.07),
        //         PinCodeTextField(
        //           appContext: context,
        //           length: 4,
        //           controller: cubit.forgetPasswordPhone,
        //           keyboardType: TextInputType.number,
        //           cursorColor: AppColors.secondaryColor,
        //           animationType: AnimationType.fade,
        //           textStyle: const TextStyle(
        //             fontSize: 32,
        //             fontWeight: FontWeight.bold,
        //           ),
        //           pinTheme: PinTheme(
        //             shape: PinCodeFieldShape.circle,
        //             fieldHeight: 75,
        //             fieldWidth: 75,
        //             activeFillColor: AppColors.grayColor,
        //             inactiveFillColor: AppColors.grayColor,
        //             selectedFillColor: AppColors.grayColor,
        //             activeColor: AppColors.grayColor,
        //             inactiveColor: AppColors.grayColor,
        //             selectedColor: AppColors.grayColor,
        //             borderWidth: 0,
        //           ),
        //           enableActiveFill: true,
        //           onChanged: (_) {},
        //         ),
        //         SizedBox(height: screenHeight * 0.05),
        //         state is AuthLoading
        //             ? const CircularProgressIndicator(
        //                 color: AppColors.secondaryColor,
        //               )
        //             : CustomButton(
        //                 onPressed: () {
        //                   cubit.forgetPasswordPhone.text;
        //                 },
        //                 text: 'Verify',
        //                 color: AppColors.secondaryColor,
        //                 colorSide: AppColors.secondaryColor,
        //                 fontColor: AppColors.primaryColor,
        //               ),
        //         SizedBox(height: screenHeight * 0.05),
        //         const ResendCodeWidget(),
        //       ],
        //     );
        //   },
        // ),
      ),
    );
  }
}
