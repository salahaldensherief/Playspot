import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:playspot/features/auth/data/models/otp_response.dart';

import '../../../data/repos/auth_repo.dart';

part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  final AuthRepo repo;
  ResendOtpCubit(this.repo) : super(ResendOtpInitial());
  TextEditingController resendOtpCode = TextEditingController();

  Future<void> resendOtp({required String phone}) async {
    emit(ResendOtpLoading());
    final failureOrResponse = await repo.resendOtp(phone: phone);
    failureOrResponse.fold(
          (left) => emit(ResendOtpFailure(message: left.errorModel.message)),
          (res) => emit(ResendOtpSuccess(res)),
    );
  }


}
