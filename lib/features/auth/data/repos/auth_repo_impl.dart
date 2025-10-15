import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:playspot/core/services/api/api_endpoint.dart';
import 'package:playspot/core/services/api/dio_consumer.dart';
import 'package:playspot/core/services/errors/error_model.dart';
import 'package:playspot/core/services/errors/exceptions.dart';
import 'package:playspot/features/auth/data/models/otp_response.dart';
import 'package:playspot/features/auth/data/models/user_model.dart';
import 'package:playspot/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final DioConsumer dio;

  AuthRepoImpl(this.dio);

  @override
  Future<Either<ServerException, UserModel>> login({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        ApiEndPoint.login,
          data: {'phone': phone, 'password': password},
      );
      return Right(UserModel.fromJson(response));
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: 'Login failed')),
      );
    }
  }

  @override
  Future<Either<ServerException, UserModel>> signup({
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        ApiEndPoint.register,
        data: {
          'name': username,
          'email': email,
          'phone': phone,
          'password': password,
        },
      );
      if (response['userId'] != null) {
        return Right(UserModel.fromJson(response));
      } else {
        final errorMessage = response['message'] ?? 'Signup failed';
        return Left(
          ServerException(errorModel: ErrorModel(message: errorMessage)),
        );
      }
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: 'Signup failed')),
      );
    }
  }

  @override
  Future<Either<ServerException, OtpResponse>> sendOtp({
    required String code,
  }) async {
    try {
      final response = await dio.post(
        ApiEndPoint.sendOtp,
        data: {'code': code},
      );
      return Right(OtpResponse.fromJson(response.data));
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: 'Send OTP failed')),
      );
    }
  }

  @override
  Future<Either<ServerException, OtpResponse>> verifyOtp({
    required String phone,
    required String code,
  }) async {
    try {
      final response = await dio.post(
        ApiEndPoint.verifyOtp,
        data: {'phone': phone, 'code': code},
      );
      return Right(OtpResponse.fromJson(response));
    } catch (e) {
      return Left(
        ServerException(errorModel: ErrorModel(message: 'Verify OTP failed')),
      );
    }
  }

  @override
  Future<Either<ServerException, void>> resetPassword({
    required String phone,
    required String newPassword,
  }) async {
    try {
      await dio.post(
        ApiEndPoint.password,
        data: {'phone': phone, 'newPassword': newPassword},
      );
      return const Right(null);
    } catch (e) {
      return Left(
        ServerException(
          errorModel: ErrorModel(message: 'Reset Password failed'),
        ),
      );
    }
  }

  @override
  Future<Either<ServerException, void>> forgetPassword({
    required String phone,
  }) async {
    try {
      await dio.post(ApiEndPoint.forgetPassword, data: {'phone': phone});
      return const Right(null);
    } catch (e) {
      return Left(
        ServerException(
          errorModel: ErrorModel(message: 'Forget Password failed'),
        ),
      );
    }
  }
}
