import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInRepo {
  Future<UserCredential?> userSignIn();
}
