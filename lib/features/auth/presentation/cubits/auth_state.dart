import 'package:equatable/equatable.dart';
import 'package:playspot/features/auth/data/models/otp_response.dart';
import 'package:playspot/features/auth/data/models/user_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

// Initial state
class AuthInitial extends AuthState {}

// Loading state
class AuthLoading extends AuthState {}

// Success states
class AuthLoginSuccess extends AuthState {
  final UserModel user;

  const AuthLoginSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthSignupSuccess extends AuthState {
  final UserModel user;

  const AuthSignupSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthOtpSent extends AuthState {
  final OtpResponse response;

  const AuthOtpSent(this.response);

  @override
  List<Object?> get props => [response];
}

class AuthOtpVerified extends AuthState {
  final OtpResponse response;

  const AuthOtpVerified(this.response);

  @override
  List<Object?> get props => [response];
}

class AuthPasswordResetSuccess extends AuthState {}

class AuthForgetPasswordSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}
