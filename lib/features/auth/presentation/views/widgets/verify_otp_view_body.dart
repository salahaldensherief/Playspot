import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:playspot/core/services/api/dio_consumer.dart';
import 'package:playspot/core/utils/app_Colors.dart';
import 'package:playspot/core/utils/textStyles.dart';
import 'package:playspot/core/widgets/custom_app_bar.dart';
import 'package:playspot/core/widgets/custom_button.dart';
import 'package:playspot/core/widgets/resend_code_widget.dart';
import 'package:playspot/features/auth/data/repos/auth_repo_impl.dart';
import 'package:playspot/features/auth/presentation/cubits/resendOtp/resend_otp_cubit.dart';
import 'package:playspot/features/auth/presentation/cubits/verifyOtp/verify_otp_cubit.dart';
import 'package:playspot/features/auth/presentation/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyOtpView extends StatefulWidget {
  const VerifyOtpView({super.key});
  static const routeName = 'verifyOtpView';

  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  String? phone;

  @override
  void initState() {
    super.initState();
    _loadPhone();
  }

  Future<void> _loadPhone() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      phone = prefs.getString('phone') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyOtpCubit>();
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        showBack: true,
        showElevation: false,
        title: 'Verify your email',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        child: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
          listener: (context, state) async {
            if (!mounted) return;
            if (state is VerifyOtpSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('OTP verified successfully, Let\`s login'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.all(16),
                ),
              );
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            } else if (state is VerifyOtpFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: screenHeight * 0.08),
                Text(
                  'Please enter the 4 digit code that was sent to your email.',
                  style: TextStyles.regular16,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.07),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  controller: cubit.otpCode,
                  keyboardType: TextInputType.number,
                  cursorColor: AppColors.secondaryColor,
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
                    activeColor: state is VerifyOtpFailure
                        ? Colors.red
                        : AppColors.grayColor,
                    inactiveColor: state is VerifyOtpFailure
                        ? Colors.red
                        : AppColors.grayColor,
                    selectedColor: state is VerifyOtpFailure
                        ? Colors.red
                        : AppColors.grayColor,
                    borderWidth: 2,
                  ),
                  enableActiveFill: true,
                  onChanged: (_) {},
                ),
                SizedBox(height: screenHeight * 0.05),
                state is VerifyOtpLoading
                    ? const CircularProgressIndicator(
                        color: AppColors.secondaryColor,
                      )
                    : CustomButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          final phone = prefs.getString('phone') ?? '';
                          final code = cubit.otpCode.text.trim();
                          cubit.verifyOtp(phone: phone, code: code);
                        },
                        text: 'Verify',
                        color: AppColors.secondaryColor,
                        colorSide: AppColors.secondaryColor,
                        fontColor: AppColors.primaryColor,
                      ),
                SizedBox(height: screenHeight * 0.05),
                 BlocProvider(
                     create: (_) => ResendOtpCubit(AuthRepoImpl(DioConsumer(dio: Dio()))),
                     child: ResendCodeWidget()),
              ],
            );
          },
        ),
      ),
    );
  }
}
