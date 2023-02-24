import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_form_state.freezed.dart';

enum LoginMethod { email, phone }

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    @Default(LoginMethod.email) LoginMethod loginMethod,
    @Default(false) bool submitting,
    @Default(false) bool emailSent,
    @Default(false) bool smsSent,
    @Default(false) bool submittingError,
  }) = _LoginFormState;
}

