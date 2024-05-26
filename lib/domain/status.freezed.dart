// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() completed,
    required TResult Function() ongoing,
    required TResult Function() inProcess,
    required TResult Function() canceled,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? completed,
    TResult? Function()? ongoing,
    TResult? Function()? inProcess,
    TResult? Function()? canceled,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? completed,
    TResult Function()? ongoing,
    TResult Function()? inProcess,
    TResult Function()? canceled,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Completed value) completed,
    required TResult Function(_Ongoing value) ongoing,
    required TResult Function(inProcess value) inProcess,
    required TResult Function(Canceled value) canceled,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Ongoing value)? ongoing,
    TResult? Function(inProcess value)? inProcess,
    TResult? Function(Canceled value)? canceled,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Completed value)? completed,
    TResult Function(_Ongoing value)? ongoing,
    TResult Function(inProcess value)? inProcess,
    TResult Function(Canceled value)? canceled,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStatusCopyWith<$Res> {
  factory $TaskStatusCopyWith(
          TaskStatus value, $Res Function(TaskStatus) then) =
      _$TaskStatusCopyWithImpl<$Res, TaskStatus>;
}

/// @nodoc
class _$TaskStatusCopyWithImpl<$Res, $Val extends TaskStatus>
    implements $TaskStatusCopyWith<$Res> {
  _$TaskStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CompletedImplCopyWith<$Res> {
  factory _$$CompletedImplCopyWith(
          _$CompletedImpl value, $Res Function(_$CompletedImpl) then) =
      __$$CompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompletedImplCopyWithImpl<$Res>
    extends _$TaskStatusCopyWithImpl<$Res, _$CompletedImpl>
    implements _$$CompletedImplCopyWith<$Res> {
  __$$CompletedImplCopyWithImpl(
      _$CompletedImpl _value, $Res Function(_$CompletedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CompletedImpl extends _Completed {
  const _$CompletedImpl() : super._();

  @override
  String toString() {
    return 'TaskStatus.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() completed,
    required TResult Function() ongoing,
    required TResult Function() inProcess,
    required TResult Function() canceled,
    required TResult Function() error,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? completed,
    TResult? Function()? ongoing,
    TResult? Function()? inProcess,
    TResult? Function()? canceled,
    TResult? Function()? error,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? completed,
    TResult Function()? ongoing,
    TResult Function()? inProcess,
    TResult Function()? canceled,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Completed value) completed,
    required TResult Function(_Ongoing value) ongoing,
    required TResult Function(inProcess value) inProcess,
    required TResult Function(Canceled value) canceled,
    required TResult Function(_Error value) error,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Ongoing value)? ongoing,
    TResult? Function(inProcess value)? inProcess,
    TResult? Function(Canceled value)? canceled,
    TResult? Function(_Error value)? error,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Completed value)? completed,
    TResult Function(_Ongoing value)? ongoing,
    TResult Function(inProcess value)? inProcess,
    TResult Function(Canceled value)? canceled,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed extends TaskStatus {
  const factory _Completed() = _$CompletedImpl;
  const _Completed._() : super._();
}

/// @nodoc
abstract class _$$OngoingImplCopyWith<$Res> {
  factory _$$OngoingImplCopyWith(
          _$OngoingImpl value, $Res Function(_$OngoingImpl) then) =
      __$$OngoingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OngoingImplCopyWithImpl<$Res>
    extends _$TaskStatusCopyWithImpl<$Res, _$OngoingImpl>
    implements _$$OngoingImplCopyWith<$Res> {
  __$$OngoingImplCopyWithImpl(
      _$OngoingImpl _value, $Res Function(_$OngoingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OngoingImpl extends _Ongoing {
  const _$OngoingImpl() : super._();

  @override
  String toString() {
    return 'TaskStatus.ongoing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OngoingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() completed,
    required TResult Function() ongoing,
    required TResult Function() inProcess,
    required TResult Function() canceled,
    required TResult Function() error,
  }) {
    return ongoing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? completed,
    TResult? Function()? ongoing,
    TResult? Function()? inProcess,
    TResult? Function()? canceled,
    TResult? Function()? error,
  }) {
    return ongoing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? completed,
    TResult Function()? ongoing,
    TResult Function()? inProcess,
    TResult Function()? canceled,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (ongoing != null) {
      return ongoing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Completed value) completed,
    required TResult Function(_Ongoing value) ongoing,
    required TResult Function(inProcess value) inProcess,
    required TResult Function(Canceled value) canceled,
    required TResult Function(_Error value) error,
  }) {
    return ongoing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Ongoing value)? ongoing,
    TResult? Function(inProcess value)? inProcess,
    TResult? Function(Canceled value)? canceled,
    TResult? Function(_Error value)? error,
  }) {
    return ongoing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Completed value)? completed,
    TResult Function(_Ongoing value)? ongoing,
    TResult Function(inProcess value)? inProcess,
    TResult Function(Canceled value)? canceled,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (ongoing != null) {
      return ongoing(this);
    }
    return orElse();
  }
}

abstract class _Ongoing extends TaskStatus {
  const factory _Ongoing() = _$OngoingImpl;
  const _Ongoing._() : super._();
}

/// @nodoc
abstract class _$$inProcessImplCopyWith<$Res> {
  factory _$$inProcessImplCopyWith(
          _$inProcessImpl value, $Res Function(_$inProcessImpl) then) =
      __$$inProcessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$inProcessImplCopyWithImpl<$Res>
    extends _$TaskStatusCopyWithImpl<$Res, _$inProcessImpl>
    implements _$$inProcessImplCopyWith<$Res> {
  __$$inProcessImplCopyWithImpl(
      _$inProcessImpl _value, $Res Function(_$inProcessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$inProcessImpl extends inProcess {
  const _$inProcessImpl() : super._();

  @override
  String toString() {
    return 'TaskStatus.inProcess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$inProcessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() completed,
    required TResult Function() ongoing,
    required TResult Function() inProcess,
    required TResult Function() canceled,
    required TResult Function() error,
  }) {
    return inProcess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? completed,
    TResult? Function()? ongoing,
    TResult? Function()? inProcess,
    TResult? Function()? canceled,
    TResult? Function()? error,
  }) {
    return inProcess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? completed,
    TResult Function()? ongoing,
    TResult Function()? inProcess,
    TResult Function()? canceled,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (inProcess != null) {
      return inProcess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Completed value) completed,
    required TResult Function(_Ongoing value) ongoing,
    required TResult Function(inProcess value) inProcess,
    required TResult Function(Canceled value) canceled,
    required TResult Function(_Error value) error,
  }) {
    return inProcess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Ongoing value)? ongoing,
    TResult? Function(inProcess value)? inProcess,
    TResult? Function(Canceled value)? canceled,
    TResult? Function(_Error value)? error,
  }) {
    return inProcess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Completed value)? completed,
    TResult Function(_Ongoing value)? ongoing,
    TResult Function(inProcess value)? inProcess,
    TResult Function(Canceled value)? canceled,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (inProcess != null) {
      return inProcess(this);
    }
    return orElse();
  }
}

abstract class inProcess extends TaskStatus {
  const factory inProcess() = _$inProcessImpl;
  const inProcess._() : super._();
}

/// @nodoc
abstract class _$$CanceledImplCopyWith<$Res> {
  factory _$$CanceledImplCopyWith(
          _$CanceledImpl value, $Res Function(_$CanceledImpl) then) =
      __$$CanceledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CanceledImplCopyWithImpl<$Res>
    extends _$TaskStatusCopyWithImpl<$Res, _$CanceledImpl>
    implements _$$CanceledImplCopyWith<$Res> {
  __$$CanceledImplCopyWithImpl(
      _$CanceledImpl _value, $Res Function(_$CanceledImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CanceledImpl extends Canceled {
  const _$CanceledImpl() : super._();

  @override
  String toString() {
    return 'TaskStatus.canceled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CanceledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() completed,
    required TResult Function() ongoing,
    required TResult Function() inProcess,
    required TResult Function() canceled,
    required TResult Function() error,
  }) {
    return canceled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? completed,
    TResult? Function()? ongoing,
    TResult? Function()? inProcess,
    TResult? Function()? canceled,
    TResult? Function()? error,
  }) {
    return canceled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? completed,
    TResult Function()? ongoing,
    TResult Function()? inProcess,
    TResult Function()? canceled,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (canceled != null) {
      return canceled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Completed value) completed,
    required TResult Function(_Ongoing value) ongoing,
    required TResult Function(inProcess value) inProcess,
    required TResult Function(Canceled value) canceled,
    required TResult Function(_Error value) error,
  }) {
    return canceled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Ongoing value)? ongoing,
    TResult? Function(inProcess value)? inProcess,
    TResult? Function(Canceled value)? canceled,
    TResult? Function(_Error value)? error,
  }) {
    return canceled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Completed value)? completed,
    TResult Function(_Ongoing value)? ongoing,
    TResult Function(inProcess value)? inProcess,
    TResult Function(Canceled value)? canceled,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (canceled != null) {
      return canceled(this);
    }
    return orElse();
  }
}

abstract class Canceled extends TaskStatus {
  const factory Canceled() = _$CanceledImpl;
  const Canceled._() : super._();
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$TaskStatusCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl() : super._();

  @override
  String toString() {
    return 'TaskStatus.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() completed,
    required TResult Function() ongoing,
    required TResult Function() inProcess,
    required TResult Function() canceled,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? completed,
    TResult? Function()? ongoing,
    TResult? Function()? inProcess,
    TResult? Function()? canceled,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? completed,
    TResult Function()? ongoing,
    TResult Function()? inProcess,
    TResult Function()? canceled,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Completed value) completed,
    required TResult Function(_Ongoing value) ongoing,
    required TResult Function(inProcess value) inProcess,
    required TResult Function(Canceled value) canceled,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Ongoing value)? ongoing,
    TResult? Function(inProcess value)? inProcess,
    TResult? Function(Canceled value)? canceled,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Completed value)? completed,
    TResult Function(_Ongoing value)? ongoing,
    TResult Function(inProcess value)? inProcess,
    TResult Function(Canceled value)? canceled,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends TaskStatus {
  const factory _Error() = _$ErrorImpl;
  const _Error._() : super._();
}
