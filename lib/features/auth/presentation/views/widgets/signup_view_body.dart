import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playspot/core/widgets/have_an_account.dart';
import 'package:playspot/features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:playspot/features/auth/presentation/views/widgets/verify_otp_view_body.dart';

import '../../../../../core/utils/app_Colors.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/textStyles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                showCloseIcon: true,
                content: Text('Sign Up successful please verify OTP'),
                backgroundColor: AppColors.greenColor,
                behavior: SnackBarBehavior.floating,
                margin:  EdgeInsets.all(16.r),
              ),
            );
           Navigator.pushReplacementNamed(context, VerifyOtpView.routeName
            );
          } else if (state is SignupFailure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.message),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: cubit.signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Center(
                    child: Image.asset(
                      AssetsData.blackLogo,
                      height: screenHeight * 0.14,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Welcome to Playspot',
                    style: TextStyles.regular11.copyWith(fontSize: 24),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Let\'s Sign Up',
                    style: TextStyles.regular11.copyWith(fontSize: 24),
                  ),
                  SizedBox(height: screenHeight * 0.06),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: cubit.signUpUsername,
                          prefixIcon: Icon(
                            FontAwesomeIcons.solidUser,
                            size: 20.sp,
                            color: AppColors.secondaryColor,
                          ),
                          hintText: 'Username',
                          textInputType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your Username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomTextFormField(
                          controller: cubit.signUpEmail,
                          prefixIcon: Icon(
                            FontAwesomeIcons.solidEnvelope,
                            size: 20.sp,
                            color: AppColors.secondaryColor,
                          ),
                          hintText: 'Email',
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomTextFormField(
                          controller: cubit.signUpPhone,
                          prefixIcon: Icon(
                            FontAwesomeIcons.phone,
                            size: 20.sp,
                            color: AppColors.secondaryColor,
                          ),
                          hintText: 'Phone Number',
                          textInputType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
                              return 'Phone number must contain 10–15 digits';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomTextFormField(
                          controller: cubit.signUpPassword,
                          prefixIcon: Icon(
                            FontAwesomeIcons.lock,
                            size: 20.sp,
                            color: AppColors.secondaryColor,
                          ),
                          hintText: 'Password',
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomButton(
                          onPressed: () {
                            if (cubit.signUpFormKey.currentState!.validate()) {
                              cubit.signup(
                                username: cubit.signUpUsername.text.trim(),
                                email: cubit.signUpEmail.text.trim(),
                                phone: cubit.signUpPhone.text.trim(),
                                password: cubit.signUpPassword.text.trim(),
                              );
                            }
                          },
                          text: state is SignupLoading ? 'Loading...' : 'Sign Up',
                          color: AppColors.secondaryColor,
                          colorSide: AppColors.secondaryColor,
                          fontColor: AppColors.primaryColor,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        const HaveAnAccountWidget(),
                      ],
                    ),
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
