import 'package:todo_list/domain/objects/index.dart';

sealed class EmailFailure extends ValueFailure {}

class NoData extends EmailFailure {
  @override
  String get message => "No data in email";
}

class InvalidString extends EmailFailure {
  @override
  String get message => "This string is not email";
}
