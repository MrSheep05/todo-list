import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/account.dart';

abstract class StorageRepository {
  TaskOption<Unit> saveAccountTask(Account account);
  TaskOption<Account> getAccountTask();
  Option<String> get uid;
}
