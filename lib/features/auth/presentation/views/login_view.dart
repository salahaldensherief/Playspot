import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playspot/features/auth/data/repos/auth_repo_impl.dart';
import 'package:playspot/core/services/api/dio_consumer.dart';
import 'package:playspot/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:playspot/features/auth/presentation/views/widgets/login_view_body.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'loginView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthRepoImpl(DioConsumer(dio: Dio()))),
      child: const LoginViewBody(),
    );
  }
}
