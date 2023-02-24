import 'package:events_app/riverpod/providers/auth_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/login_form_state.dart';

class LoginFormStateNotifier extends StateNotifier<LoginFormState> {
  LoginFormStateNotifier() : super(const LoginFormState());

  void changeLoginMethod(LoginMethod loginMethod) {
    state = LoginFormState(loginMethod: loginMethod);
  }

  String get submitButtonText => state.loginMethod == LoginMethod.email
      ? 'Login with Email'
      : 'Login with Phone';

  String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? validatePhone(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  void handleEmailLogin(String text) {
    state = state.copyWith(submitting: true);
    Future.delayed(const Duration(seconds: 2), () {
      state = const LoginFormState(emailSent: true);
    });
  }

  handlePhoneLogin(BuildContext context,String text,FirebaseAuthProvider firebaseAuthProvider) {
    state = state.copyWith(submitting: true);
    firebaseAuthProvider.verifyPhoneNumber(
      context: context,
      phoneNumber: text,
    );
  }
}

final loginFormNotifierProvider =
StateNotifierProvider.autoDispose<LoginFormStateNotifier, LoginFormState>(
        (ref) {
      return LoginFormStateNotifier();
    });