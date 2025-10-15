import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playspot/core/services/api/dio_consumer.dart';
import 'package:playspot/features/auth/data/repos/auth_repo_impl.dart';
import 'package:playspot/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:playspot/features/auth/presentation/views/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const routeName = 'forgetPasswordView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepoImpl(DioConsumer(dio: Dio()))),
      child: ForgetPasswordViewBody(),
    );
  }
}
