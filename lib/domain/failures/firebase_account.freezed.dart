// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountRepositoryFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() firestoreError,
    required TResult Function() modelError,
    required TResult Function() unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? firestoreError,
    TResult? Function()? modelError,
    TResult? Function()? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? firestoreError,
    TResult Function()? modelError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirestoreError value) firestoreError,
    required TResult Function(_ModelError value) modelError,
    required TResult Function(_Unexpected value) unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirestoreError value)? firestoreError,
    TResult? Function(_ModelError value)? modelError,
    TResult? Function(_Unexpected value)? unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirestoreError value)? firestoreError,
    TResult Function(_ModelError value)? modelError,
    TResult Function(_Unexpected value)? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountRepositoryFailureCopyWith<$Res> {
  factory $AccountRepositoryFailureCopyWith(AccountRepositoryFailure value,
          $Res Function(AccountRepositoryFailure) then) =
      _$AccountRepositoryFailureCopyWithImpl<$Res, AccountRepositoryFailure>;
}

/// @nodoc
class _$AccountRepositoryFailureCopyWithImpl<$Res,
        $Val extends AccountRepositoryFailure>
    implements $AccountRepositoryFailureCopyWith<$Res> {
  _$AccountRepositoryFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FirestoreErrorImplCopyWith<$Res> {
  factory _$$FirestoreErrorImplCopyWith(_$FirestoreErrorImpl value,
          $Res Function(_$FirestoreErrorImpl) then) =
      __$$FirestoreErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FirestoreErrorImplCopyWithImpl<$Res>
    extends _$AccountRepositoryFailureCopyWithImpl<$Res, _$FirestoreErrorImpl>
    implements _$$FirestoreErrorImplCopyWith<$Res> {
  __$$FirestoreErrorImplCopyWithImpl(
      _$FirestoreErrorImpl _value, $Res Function(_$FirestoreErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FirestoreErrorImpl extends _FirestoreError {
  const _$FirestoreErrorImpl() : super._();

  @override
  String toString() {
    return 'AccountRepositoryFailure.firestoreError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FirestoreErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() firestoreError,
    required TResult Function() modelError,
    required TResult Function() unexpectedError,
  }) {
    return firestoreError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? firestoreError,
    TResult? Function()? modelError,
    TResult? Function()? unexpectedError,
  }) {
    return firestoreError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? firestoreError,
    TResult Function()? modelError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (firestoreError != null) {
      return firestoreError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirestoreError value) firestoreError,
    required TResult Function(_ModelError value) modelError,
    required TResult Function(_Unexpected value) unexpectedError,
  }) {
    return firestoreError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirestoreError value)? firestoreError,
    TResult? Function(_ModelError value)? modelError,
    TResult? Function(_Unexpected value)? unexpectedError,
  }) {
    return firestoreError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirestoreError value)? firestoreError,
    TResult Function(_ModelError value)? modelError,
    TResult Function(_Unexpected value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (firestoreError != null) {
      return firestoreError(this);
    }
    return orElse();
  }
}

abstract class _FirestoreError extends AccountRepositoryFailure {
  const factory _FirestoreError() = _$FirestoreErrorImpl;
  const _FirestoreError._() : super._();
}

/// @nodoc
abstract class _$$ModelErrorImplCopyWith<$Res> {
  factory _$$ModelErrorImplCopyWith(
          _$ModelErrorImpl value, $Res Function(_$ModelErrorImpl) then) =
      __$$ModelErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ModelErrorImplCopyWithImpl<$Res>
    extends _$AccountRepositoryFailureCopyWithImpl<$Res, _$ModelErrorImpl>
    implements _$$ModelErrorImplCopyWith<$Res> {
  __$$ModelErrorImplCopyWithImpl(
      _$ModelErrorImpl _value, $Res Function(_$ModelErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ModelErrorImpl extends _ModelError {
  const _$ModelErrorImpl() : super._();

  @override
  String toString() {
    return 'AccountRepositoryFailure.modelError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ModelErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() firestoreError,
    required TResult Function() modelError,
    required TResult Function() unexpectedError,
  }) {
    return modelError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? firestoreError,
    TResult? Function()? modelError,
    TResult? Function()? unexpectedError,
  }) {
    return modelError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? firestoreError,
    TResult Function()? modelError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (modelError != null) {
      return modelError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirestoreError value) firestoreError,
    required TResult Function(_ModelError value) modelError,
    required TResult Function(_Unexpected value) unexpectedError,
  }) {
    return modelError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirestoreError value)? firestoreError,
    TResult? Function(_ModelError value)? modelError,
    TResult? Function(_Unexpected value)? unexpectedError,
  }) {
    return modelError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirestoreError value)? firestoreError,
    TResult Function(_ModelError value)? modelError,
    TResult Function(_Unexpected value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (modelError != null) {
      return modelError(this);
    }
    return orElse();
  }
}

abstract class _ModelError extends AccountRepositoryFailure {
  const factory _ModelError() = _$ModelErrorImpl;
  const _ModelError._() : super._();
}

/// @nodoc
abstract class _$$UnexpectedImplCopyWith<$Res> {
  factory _$$UnexpectedImplCopyWith(
          _$UnexpectedImpl value, $Res Function(_$UnexpectedImpl) then) =
      __$$UnexpectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnexpectedImplCopyWithImpl<$Res>
    extends _$AccountRepositoryFailureCopyWithImpl<$Res, _$UnexpectedImpl>
    implements _$$UnexpectedImplCopyWith<$Res> {
  __$$UnexpectedImplCopyWithImpl(
      _$UnexpectedImpl _value, $Res Function(_$UnexpectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnexpectedImpl extends _Unexpected {
  const _$UnexpectedImpl() : super._();

  @override
  String toString() {
    return 'AccountRepositoryFailure.unexpectedError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnexpectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() firestoreError,
    required TResult Function() modelError,
    required TResult Function() unexpectedError,
  }) {
    return unexpectedError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? firestoreError,
    TResult? Function()? modelError,
    TResult? Function()? unexpectedError,
  }) {
    return unexpectedError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? firestoreError,
    TResult Function()? modelError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirestoreError value) firestoreError,
    required TResult Function(_ModelError value) modelError,
    required TResult Function(_Unexpected value) unexpectedError,
  }) {
    return unexpectedError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirestoreError value)? firestoreError,
    TResult? Function(_ModelError value)? modelError,
    TResult? Function(_Unexpected value)? unexpectedError,
  }) {
    return unexpectedError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirestoreError value)? firestoreError,
    TResult Function(_ModelError value)? modelError,
    TResult Function(_Unexpected value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(this);
    }
    return orElse();
  }
}

abstract class _Unexpected extends AccountRepositoryFailure {
  const factory _Unexpected() = _$UnexpectedImpl;
  const _Unexpected._() : super._();
}
