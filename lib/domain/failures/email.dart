import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/domain/objects/index.dart';

part 'email.freezed.dart';

@freezed
class EmailFailure extends ValueFailure with _$EmailFailure {
  const EmailFailure._();

  const factory EmailFailure.noData() = _NoData;
  const factory EmailFailure.invalidString() = _InvalidString;

  @override
  String get message => map(noData: (_) => "Login cannot be empty", invalidString: (_) => "Login must be an email");
}
