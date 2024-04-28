import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bmi/cores/di.dart';
import 'package:bmi/cores/utils/navigator.dart';
import 'package:bmi/features/home_feature/presention/home_screen.dart';
import 'package:bmi/features/home_layout_feature/presention/home_layout_screen.dart';
import 'package:bmi/features/sign_in_feature/data/dataSource/remote/repo/sign_in_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  SignInRepo? signInRepo = getIt.get<SignInRepo>();

  Future<UserCredential?> signInCubit() async {
    emit(SignInLoading());
    UserCredential? userCredential = await signInRepo!.userSignIn();
    log(userCredential.toString());
    if (userCredential!.user != null) {
      emit(SignInInSuccess());
      return userCredential;
    } else {
      emit(SignInInError());
      return null;
    }
  }

  Future<void> checkSignIn(BuildContext context, SignInState state) async {
    var user = await signInCubit();
    if (user != null) {
      // navigatTo(context, const HomeScreen());
      navigatTo(context, const HomeLayoutScreen());
    } else if (state is SignInInError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('There are an error')));
    }
  }
}
