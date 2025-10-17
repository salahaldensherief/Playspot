part of 'resend_otp_cubit.dart';

@immutable
sealed class ResendOtpState {}

final class ResendOtpInitial extends ResendOtpState {}
final class ResendOtpLoading extends ResendOtpState {}
final class ResendOtpSuccess extends ResendOtpState {
  OtpResponse response;
  ResendOtpSuccess(this.response);
}
final class ResendOtpFailure extends ResendOtpState {
  final String message;
  ResendOtpFailure({required this.message});
}