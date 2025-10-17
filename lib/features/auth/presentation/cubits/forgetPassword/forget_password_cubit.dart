import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/auth_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthRepo repo;
  ForgetPasswordCubit(this.repo) : super(ForgetPasswordInitial());
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey();
  TextEditingController forgetPasswordPhone = TextEditingController();

  Future<void> forgetPassword({required String phone}) async {
    emit(ForgetPasswordLoading());
    final failureOrResponse = await repo.forgetPassword(phone: phone);
    failureOrResponse.fold(
          (left) => emit(ForgetPasswordFailure(message: left.errorModel.message)),
          (_) => emit(ForgetPasswordSuccess()),
    );
  }

}
