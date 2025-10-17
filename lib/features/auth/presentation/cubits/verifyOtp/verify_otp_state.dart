part of 'verify_otp_cubit.dart';

@immutable
sealed class VerifyOtpState {}

final class VerifyOtpInitial extends VerifyOtpState {}
final class VerifyOtpLoading extends VerifyOtpState {}
final class VerifyOtpSuccess extends VerifyOtpState {
 final OtpResponse response;
  VerifyOtpSuccess(this.response);
}
final class VerifyOtpFailure extends VerifyOtpState {
  final String message;
  VerifyOtpFailure({required this.message});
}
