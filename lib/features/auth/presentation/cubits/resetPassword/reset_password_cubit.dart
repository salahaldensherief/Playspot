import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:playspot/features/auth/data/repos/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo repo;
  ResetPasswordCubit(this.repo) : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String phone,
    required String newPassword,
  }) async {
    emit(ResetPasswordLoading());
    final failureOrResponse = await repo.resetPassword(
      phone: phone,
      newPassword: newPassword,
    );
    failureOrResponse.fold(
          (left) => emit(ResetPasswordFailure(message: left.errorModel.message)),
          (_) => emit(ResetPasswordSuccess()),
    );
  }
}
