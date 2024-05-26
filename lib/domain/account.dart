import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/objects/index.dart';
import 'package:todo_list/domain/validated/email.dart';
import 'package:todo_list/domain/validated/name.dart';
import 'package:todo_list/domain/validated/unique_id.dart';

class Account {
  final UniqueId _uid;
  final Name _username;
  final Email _email;
  const Account._(this._uid, this._email, this._username);

  factory Account(UniqueIdObject uidObject, NameObject nameObject, EmailObject emailObject) {
    return uidObject.valueFailureOrUnit
        .andThen(() => nameObject.valueFailureOrUnit)
        .andThen(() => emailObject.valueFailureOrUnit)
        .fold((l) => throw ValueObjectException(l),
            (r) => Account._(uidObject.getOrCrash(), emailObject.getOrCrash(), nameObject.getOrCrash()));
  }

  static TaskOption<Account> createUser(UniqueIdObject uidObject, NameObject nameObject, EmailObject emailObject) {
    return TaskOption.tryCatch(() async => Account(uidObject, nameObject, emailObject));
  }

  String get uid => _uid.value;
  String get username => _username.value;
  String get email => _email.value;
}
