import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playspot/core/services/api/dio_consumer.dart';
import 'package:playspot/features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:playspot/features/auth/presentation/views/widgets/signup_view_body.dart';

import '../../data/repos/auth_repo_impl.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signupView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(AuthRepoImpl(DioConsumer(dio: Dio()))),
      child: SignupViewBody(),
    );
  }
}
