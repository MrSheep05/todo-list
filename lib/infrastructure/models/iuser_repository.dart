import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/account.dart';
import 'package:todo_list/domain/failures/firebase_account.dart';

abstract class AccountRepository {
  TaskEither<AccountRepositoryFailure, Unit> saveAccountTask(Account user);
  TaskEither<AccountRepositoryFailure, Account> getAccountTask(User user);
}
