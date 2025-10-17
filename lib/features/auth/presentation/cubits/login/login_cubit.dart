import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo repo;

  LoginCubit(this.repo) : super(LoginInitial());
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInPhone = TextEditingController();
  TextEditingController signInPassword = TextEditingController();


  Future<void> login({required String phone, required String password}) async {
    emit(LoginLoading());
    final failureOrUser = await repo.login(phone: phone, password: password);
    failureOrUser.fold(
          (left) => emit(LoginFailure(message: left.errorModel.message)),
          (user) => emit(LoginSuccess(user)),
    );
  }

}
