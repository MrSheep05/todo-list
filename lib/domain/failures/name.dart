import 'package:todo_list/domain/objects/index.dart';

sealed class NameFailure extends ValueFailure {}

class NameNoData extends NameFailure {
  @override
  String get message => "No data in name";
}

class NameTooLong extends NameFailure {
  @override
  String get message => "Name is too long";
}

class NameTooShort extends NameFailure {
  @override
  String get message => "Name is too short";
}
