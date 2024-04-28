import 'dart:developer';

import 'package:bmi/features/sign_in_feature/data/dataSource/remote/repo/sign_in_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepoImp extends SignInRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<UserCredential?> userSignIn() async {
    try {
      return await _auth.signInAnonymously();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
