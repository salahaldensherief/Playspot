import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/models/otp_response.dart';
import '../../../data/repos/auth_repo.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final AuthRepo repo;
  VerifyOtpCubit(this.repo) : super(VerifyOtpInitial());
  TextEditingController otpCode = TextEditingController();

  Future<void> verifyOtp({required String phone, required String code}) async {
    emit(VerifyOtpLoading());
    final failureOrResponse = await repo.verifyOtp(phone: phone, code: code);
    failureOrResponse.fold(
          (left) => emit(VerifyOtpFailure(message: left.errorModel.message)),
          (res) => emit(VerifyOtpSuccess(res)),
    );
  }

}
