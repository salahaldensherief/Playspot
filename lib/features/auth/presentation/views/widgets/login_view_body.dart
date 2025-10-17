import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playspot/core/utils/app_Colors.dart';
import 'package:playspot/core/widgets/custom_text_field.dart';
import 'package:playspot/core/widgets/dont_have_an_account_widget.dart';
import 'package:playspot/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:playspot/features/auth/presentation/views/forget_password_view.dart';
import 'package:playspot/features/auth/presentation/views/widgets/verify_otp_view_body.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/textStyles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../layout/presentation/views/layout_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    var screenheigth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, LayoutView.routeName);
          } else if (state is LoginFailure) {
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
          return Form(
            key: cubit.signInFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenheigth * 0.1),
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
                  SizedBox(height: screenheigth * 0.06),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your phone';
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            FontAwesomeIcons.phone,
                            size: 20.sp,
                            color: AppColors.secondaryColor,
                          ),
                          hintText: 'Phone Number',
                          textInputType: TextInputType.emailAddress,
                          controller: cubit.signInPhone,
                        ),
                        SizedBox(height: screenheigth * 0.02),
                        CustomTextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            FontAwesomeIcons.lock,
                            size: 20.sp,
                            color: AppColors.secondaryColor,
                          ),
                          controller: cubit.signInPassword,

                          hintText: 'Password',
                          textInputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: screenheigth * 0.001),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                ForgetPasswordView.routeName,
                              );
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
                        state is LoginLoading
                            ? CircularProgressIndicator()
                            : CustomButton(
                                onPressed: () {
                                  if (cubit.signInFormKey.currentState!
                                      .validate()) {
                                    cubit.login(
                                      phone: cubit.signInPhone.text,
                                      password: cubit.signInPassword.text,
                                    );
                                  }
                                },
                                text: 'Log In',
                                color: AppColors.secondaryColor,
                                colorSide: AppColors.secondaryColor,
                                fontColor: AppColors.primaryColor,
                              ),
                        SizedBox(height: screenheigth * 0.02),
                        DontHaveAnAccountWidget(),
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
