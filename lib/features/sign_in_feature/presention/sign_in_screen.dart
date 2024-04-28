import 'package:bmi/cores/di.dart';
import 'package:bmi/cores/utils/app_strings.dart';
import 'package:bmi/cores/utils/navigator.dart';
import 'package:bmi/cores/widgets/default_button.dart';
import 'package:bmi/features/home_feature/presention/home_screen.dart';
import 'package:bmi/features/sign_in_feature/presention/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late SignInCubit signInCubit;
  @override
  void initState() {
    super.initState();
    signInCubit = getIt.get<SignInCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<SignInCubit, SignInState>(
                bloc: signInCubit,
                builder: (context, state) {
                  return state is SignInLoading
                      ? const Center(child: CircularProgressIndicator())
                      : DefalutButton(
                          title: AppStrings.signInButton,
                          onTap: () async {
                            await signInCubit.checkSignIn(context, state);
                          });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
