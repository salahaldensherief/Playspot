import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:playspot/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo repo;
  String? otpPhoneValue;

  SignupCubit(this.repo) : super(SignupInitial());
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  TextEditingController signUpUsername = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController otpCode = TextEditingController();

  Future<void> signup({
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(SignupLoading());
    final failureOrUser = await repo.signup(
      username: username,
      email: email,
      phone: phone,
      password: password,
    );

    failureOrUser.fold(
          (left) => emit(SignupFailure(message: left.errorModel.message)),
          (user) async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('phone', phone);
        final code = otpCode.text.trim();
        otpPhoneValue = phone;

        emit(SignupSuccess(user));
      },
    );
  }
}
