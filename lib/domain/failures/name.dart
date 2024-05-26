import 'package:todo_list/domain/objects/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'name.freezed.dart';

@freezed
class NameFailure extends ValueFailure with _$NameFailure {
  const NameFailure._();

  const factory NameFailure.noData() = _NoData;
  const factory NameFailure.tooLong() = _TooLong;
  const factory NameFailure.tooShort() = _TooShort;

  @override
  String get message => map(
      noData: (_) => "Name cannot be empty", tooLong: (_) => "Name is too long", tooShort: (_) => "Name is too short");
}
