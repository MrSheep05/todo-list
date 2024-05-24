import 'package:todo_list/domain/objects/index.dart';

sealed class EmailFailure extends ValueFailure {}

class EmailNoData extends EmailFailure {
  @override
  String get message => "No data in email";
}

class EmailInvalidString extends EmailFailure {
  @override
  String get message => "This string is not email";
}
