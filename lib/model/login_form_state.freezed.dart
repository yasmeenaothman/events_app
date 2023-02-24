// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginFormState {
  LoginMethod get loginMethod => throw _privateConstructorUsedError;
  bool get submitting => throw _privateConstructorUsedError;
  bool get emailSent => throw _privateConstructorUsedError;
  bool get smsSent => throw _privateConstructorUsedError;
  bool get submittingError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFormStateCopyWith<LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormStateCopyWith<$Res> {
  factory $LoginFormStateCopyWith(
          LoginFormState value, $Res Function(LoginFormState) then) =
      _$LoginFormStateCopyWithImpl<$Res, LoginFormState>;
  @useResult
  $Res call(
      {LoginMethod loginMethod,
      bool submitting,
      bool emailSent,
      bool smsSent,
      bool submittingError});
}

/// @nodoc
class _$LoginFormStateCopyWithImpl<$Res, $Val extends LoginFormState>
    implements $LoginFormStateCopyWith<$Res> {
  _$LoginFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginMethod = null,
    Object? submitting = null,
    Object? emailSent = null,
    Object? smsSent = null,
    Object? submittingError = null,
  }) {
    return _then(_value.copyWith(
      loginMethod: null == loginMethod
          ? _value.loginMethod
          : loginMethod // ignore: cast_nullable_to_non_nullable
              as LoginMethod,
      submitting: null == submitting
          ? _value.submitting
          : submitting // ignore: cast_nullable_to_non_nullable
              as bool,
      emailSent: null == emailSent
          ? _value.emailSent
          : emailSent // ignore: cast_nullable_to_non_nullable
              as bool,
      smsSent: null == smsSent
          ? _value.smsSent
          : smsSent // ignore: cast_nullable_to_non_nullable
              as bool,
      submittingError: null == submittingError
          ? _value.submittingError
          : submittingError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginFormStateCopyWith<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  factory _$$_LoginFormStateCopyWith(
          _$_LoginFormState value, $Res Function(_$_LoginFormState) then) =
      __$$_LoginFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoginMethod loginMethod,
      bool submitting,
      bool emailSent,
      bool smsSent,
      bool submittingError});
}

/// @nodoc
class __$$_LoginFormStateCopyWithImpl<$Res>
    extends _$LoginFormStateCopyWithImpl<$Res, _$_LoginFormState>
    implements _$$_LoginFormStateCopyWith<$Res> {
  __$$_LoginFormStateCopyWithImpl(
      _$_LoginFormState _value, $Res Function(_$_LoginFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginMethod = null,
    Object? submitting = null,
    Object? emailSent = null,
    Object? smsSent = null,
    Object? submittingError = null,
  }) {
    return _then(_$_LoginFormState(
      loginMethod: null == loginMethod
          ? _value.loginMethod
          : loginMethod // ignore: cast_nullable_to_non_nullable
              as LoginMethod,
      submitting: null == submitting
          ? _value.submitting
          : submitting // ignore: cast_nullable_to_non_nullable
              as bool,
      emailSent: null == emailSent
          ? _value.emailSent
          : emailSent // ignore: cast_nullable_to_non_nullable
              as bool,
      smsSent: null == smsSent
          ? _value.smsSent
          : smsSent // ignore: cast_nullable_to_non_nullable
              as bool,
      submittingError: null == submittingError
          ? _value.submittingError
          : submittingError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginFormState
    with DiagnosticableTreeMixin
    implements _LoginFormState {
  const _$_LoginFormState(
      {this.loginMethod = LoginMethod.email,
      this.submitting = false,
      this.emailSent = false,
      this.smsSent = false,
      this.submittingError = false});

  @override
  @JsonKey()
  final LoginMethod loginMethod;
  @override
  @JsonKey()
  final bool submitting;
  @override
  @JsonKey()
  final bool emailSent;
  @override
  @JsonKey()
  final bool smsSent;
  @override
  @JsonKey()
  final bool submittingError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginFormState(loginMethod: $loginMethod, submitting: $submitting, emailSent: $emailSent, smsSent: $smsSent, submittingError: $submittingError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginFormState'))
      ..add(DiagnosticsProperty('loginMethod', loginMethod))
      ..add(DiagnosticsProperty('submitting', submitting))
      ..add(DiagnosticsProperty('emailSent', emailSent))
      ..add(DiagnosticsProperty('smsSent', smsSent))
      ..add(DiagnosticsProperty('submittingError', submittingError));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginFormState &&
            (identical(other.loginMethod, loginMethod) ||
                other.loginMethod == loginMethod) &&
            (identical(other.submitting, submitting) ||
                other.submitting == submitting) &&
            (identical(other.emailSent, emailSent) ||
                other.emailSent == emailSent) &&
            (identical(other.smsSent, smsSent) || other.smsSent == smsSent) &&
            (identical(other.submittingError, submittingError) ||
                other.submittingError == submittingError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginMethod, submitting,
      emailSent, smsSent, submittingError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginFormStateCopyWith<_$_LoginFormState> get copyWith =>
      __$$_LoginFormStateCopyWithImpl<_$_LoginFormState>(this, _$identity);
}

abstract class _LoginFormState implements LoginFormState {
  const factory _LoginFormState(
      {final LoginMethod loginMethod,
      final bool submitting,
      final bool emailSent,
      final bool smsSent,
      final bool submittingError}) = _$_LoginFormState;

  @override
  LoginMethod get loginMethod;
  @override
  bool get submitting;
  @override
  bool get emailSent;
  @override
  bool get smsSent;
  @override
  bool get submittingError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginFormStateCopyWith<_$_LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
