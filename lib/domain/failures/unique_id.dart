import 'package:todo_list/domain/objects/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unique_id.freezed.dart';

@freezed
class UniqueIdFailure extends ValueFailure with _$UniqueIdFailure {
  const UniqueIdFailure._();

  const factory UniqueIdFailure.noData() = _NoData;

  @override
  String get message => "Id nie moe być puste";
}
