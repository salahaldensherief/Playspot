import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:playspot/features/auth/data/models/otp_response.dart';
import 'package:playspot/features/auth/data/models/user_model.dart';
import 'package:playspot/features/auth/data/repos/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repo;
  String? otpPhoneValue;
  AuthCubit(this.repo) : super(AuthInitial());
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInPhone = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpUsername = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey();
  TextEditingController forgetPasswordPhone = TextEditingController();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey();
  TextEditingController resetPasswordPhone = TextEditingController();
  TextEditingController resetPasswordNewPassword = TextEditingController();
  GlobalKey<FormState> otpFormKey = GlobalKey();
  TextEditingController otpCode = TextEditingController();

  // Login
  Future<void> login({required String phone, required String password}) async {
    emit(AuthLoading());
    final failureOrUser = await repo.login(phone: phone, password: password);
    failureOrUser.fold(
      (left) => emit(AuthError(message: left.errorModel.message)),
      (user) => emit(AuthLoginSuccess(user)),
    );
  }

  // Signup
  Future<void> signup({
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(AuthLoading());
    final failureOrUser = await repo.signup(
      username: username,
      email: email,
      phone: phone,
      password: password,
    );

    failureOrUser.fold(
      (left) => emit(AuthError(message: left.errorModel.message)),
      (user) async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('phone', phone);
        final code = otpCode.text.trim();
        otpPhoneValue = phone;

        emit(AuthSignupSuccess(user));
      },
    );
  }

  // Send OTP
  Future<void> sendOtp({required String code}) async {
    emit(AuthLoading());
    final failureOrResponse = await repo.sendOtp(code: code);
    failureOrResponse.fold(
      (left) => emit(AuthError(message: left.errorModel.message)),
      (res) => emit(AuthOtpSent(res)),
    );
  }

  // Verify OTP
  Future<void> verifyOtp({required String phone, required String code}) async {
    emit(AuthLoading());
    final failureOrResponse = await repo.verifyOtp(
      phone: phone,
      code: code,
    );
    failureOrResponse.fold(
      (left) => emit(AuthError(message: left.errorModel.message)),
      (res) => emit(AuthOtpVerified(res)),
    );
  }

  // Reset Password
  Future<void> resetPassword({
    required String phone,
    required String newPassword,
  }) async {
    emit(AuthLoading());
    final failureOrResponse = await repo.resetPassword(
      phone: phone,
      newPassword: newPassword,
    );
    failureOrResponse.fold(
      (left) => emit(AuthError(message: left.errorModel.message)),
      (_) => emit(AuthPasswordResetSuccess()),
    );
  }

  // Forget Password
  Future<void> forgetPassword({required String phone}) async {
    emit(AuthLoading());
    final failureOrResponse = await repo.forgetPassword(phone: phone);
    failureOrResponse.fold(
      (left) => emit(AuthError(message: left.errorModel.message)),
      (_) => emit(AuthForgetPasswordSuccess()),
    );
  }
}
