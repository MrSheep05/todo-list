import 'package:fpdart/fpdart.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list/core/storage_keys.dart';
import 'package:todo_list/domain/account.dart';
import 'package:todo_list/domain/models/account_model.dart';
import 'package:todo_list/infrastructure/models/istorage.repository.dart';

class LocalStorageRepo extends StorageRepository {
  final storage = GetStorage();
  @override
  TaskOption<Account> getAccountTask() {
    return TaskOption.tryCatch(() async => AccountModel.fromStorage(storage).toDomain());
  }

  @override
  TaskOption<Unit> saveAccountTask(Account account) {
    return TaskOption.tryCatch(() async => await storage.write(StorageKeys.ACCONT_EMAIL, account.email))
        .andThen(() => TaskOption.tryCatch(() async => await storage.write(StorageKeys.ACCONT_UID, account.uid)))
        .andThen(
            () => TaskOption.tryCatch(() async => await storage.write(StorageKeys.ACCONT_USERNAME, account.username)))
        .map((_) => unit);
  }
}
