import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/account.dart';
import 'package:todo_list/domain/objects/index.dart';

abstract class AccountRepository {
  TaskEither<ValueFailure, Unit> saveAccountTask(Account user);
  TaskEither<ValueFailure, Account> getAccountTask(User user);
}
