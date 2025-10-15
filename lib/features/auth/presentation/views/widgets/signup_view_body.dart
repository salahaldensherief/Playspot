import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playspot/core/widgets/have_an_account.dart';
import 'package:playspot/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:playspot/features/auth/presentation/cubits/auth_state.dart';
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
    final cubit = context.read<AuthCubit>();
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSignupSuccess ) {
              Navigator.pushReplacementNamed(
                  context, VerifyOtpView.routeName,

              );
          } else if (state is AuthError ) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.1),
                Center(
                  child: Image.asset(
                    height: screenHeight * 0.14,
                    AssetsData.blackLogo,
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
                SizedBox(height: screenHeight * 0.07),
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
                        hintText: 'Username', textInputType: TextInputType.name,
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
                      ),
                      SizedBox(height: screenHeight * 0.02),
                  CustomButton(
                        onPressed: () {
                          cubit.signup(
                            username: cubit.signUpUsername.text,
                            email: cubit.signUpEmail.text,
                            phone: cubit.signUpPhone.text,
                            password: cubit.signUpPassword.text,
                          );
                        },
                        text: state is AuthLoading ? 'Loading...' : 'Sign Up',
                        color: AppColors.secondaryColor,
                        colorSide: AppColors.secondaryColor,
                        fontColor: AppColors.primaryColor,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      HaveAnAccountWidget(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
