import 'package:dartz/dartz.dart';
import 'package:playspot/core/services/errors/exceptions.dart';
import 'package:playspot/features/auth/data/models/user_model.dart';

import '../models/otp_response.dart';

abstract class AuthRepo {
  Future<Either<ServerException, UserModel>> login({
    required String phone,
    required String password,
  });
  Future<Either<ServerException, UserModel>> signup({
    required String username,
    required String email,
    required String phone,
    required String password,
  });
  Future<Either<ServerException, void>> forgetPassword({required String phone});
  Future<Either<ServerException, void>> resetPassword({
    required String phone,
    required String newPassword,
  });
  Future<Either<ServerException, OtpResponse>> resendOtp({
    required String phone,
  });

  Future<Either<ServerException, OtpResponse>> verifyOtp({
    required String phone,
    required String code,
  });

}

