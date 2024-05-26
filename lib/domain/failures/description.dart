import 'package:todo_list/domain/objects/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'description.freezed.dart';

@freezed
class DescriptionFailure extends ValueFailure with _$DescriptionFailure {
  const DescriptionFailure._();

  const factory DescriptionFailure.noData() = _NoData;
  const factory DescriptionFailure.tooLong() = _TooLong;
  const factory DescriptionFailure.tooShort() = _TooShort;

  @override
  String get message => map(
      noData: (_) => "Description cannot be empty",
      tooLong: (_) => "Description is too long",
      tooShort: (_) => "Description is too short");
}
