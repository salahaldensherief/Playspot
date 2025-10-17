import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playspot/core/utils/app_colors.dart';
import 'package:playspot/core/utils/textStyles.dart';
import 'package:playspot/features/auth/presentation/cubits/resendOtp/resend_otp_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResendOtpCubit>();

    return BlocListener<ResendOtpCubit, ResendOtpState>(
      listener: (context, state) {
        if (state is ResendOtpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('🔁 A new OTP has been sent!'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(16),
            ),
          );
        } else if (state is ResendOtpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(text: 'Didn’t receive a code?  '),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  final prefs = await SharedPreferences.getInstance();
                  final phone = prefs.getString('phone') ?? '';
                  cubit.resendOtp(phone: phone);
                },
              text: 'Resend code',
              style: TextStyles.medium15.copyWith(
                color: AppColors.secondaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
