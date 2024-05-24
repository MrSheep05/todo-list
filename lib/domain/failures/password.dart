import 'package:todo_list/domain/objects/index.dart';

sealed class PasswordFailure extends ValueFailure {}

class PasswordNoData extends PasswordFailure {
  @override
  String get message => "No data in password";
}

class PasswordTooWeak extends PasswordFailure {
  @override
  String get message => "Password is too weak";
}

class PasswordTooShort extends PasswordFailure {
  @override
  String get message => "Password is too short";
}
