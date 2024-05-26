import 'package:todo_list/domain/objects/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password.freezed.dart';

@freezed
class PasswordFailure extends ValueFailure with _$PasswordFailure {
  const PasswordFailure._();

  const factory PasswordFailure.noData() = _NoData;
  const factory PasswordFailure.tooWeak() = _TooWeak;
  const factory PasswordFailure.tooShort() = _TooShort;

  @override
  String get message => map(
      noData: (_) => "Password cannot be empty",
      tooWeak: (_) => "Password is too weak",
      tooShort: (_) => "Password must be at least 8 characters long");
}
