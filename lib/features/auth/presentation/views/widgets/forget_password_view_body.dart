import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:playspot/core/utils/app_Colors.dart';
import 'package:playspot/core/widgets/custom_app_bar.dart';
import 'package:playspot/core/widgets/custom_button.dart';
import 'package:playspot/core/widgets/custom_text_field.dart';
import 'package:playspot/features/auth/presentation/cubits/forgetPassword/forget_password_cubit.dart';
import 'package:playspot/features/auth/presentation/views/widgets/reset_password_otp.dart';
import 'package:playspot/features/auth/presentation/views/widgets/verify_otp_view_body.dart';

import '../../../../../core/utils/textStyles.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        showElevation: false,
        showBack: true,
        title: 'Forget Password',
      ),
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            Navigator.pushNamed(context, ResetPasswordOtp.routeName);
          } else if (state is ForgetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 24.0.w),
            child: Form(
              key: cubit.forgetPasswordFormKey,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.07),
                  Text(
                    'Please enter your phone number to reset your password',
                    style: TextStyles.regular16,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextFormField(
                    controller: cubit.forgetPasswordPhone,
                    hintText: 'Enter your phone number',
                    textInputType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  state is ForgetPasswordLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          onPressed: () {
                            if (cubit.forgetPasswordFormKey.currentState!
                                .validate()) {
                              cubit.forgetPassword(
                                phone: cubit.forgetPasswordPhone.text,
                              );
                            }
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
        },
      ),
    );
  }
}
