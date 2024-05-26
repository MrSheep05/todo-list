import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:signals/signals.dart';
import 'package:todo_list/controllers/home_controller.dart';

import 'package:todo_list/core/dialog_api.dart';
import 'package:todo_list/infrastructure/models/istorage.repository.dart';
import 'package:todo_list/infrastructure/models/iuser_repository.dart';
import 'package:todo_list/routes/paths.dart';

var auth = FirebaseAuth.instance;
final getIt = GetIt.instance;

class SplashController {
  final AccountRepository accountRepo;
  final StorageRepository storageRepo;
  final userStream = streamSignal(auth.userChanges, initialValue: auth.currentUser);

  User? get user => userStream.value.value;
  SplashController(this.accountRepo, this.storageRepo) {
    effect(_handleUserChange);
  }

  Future<void> _handleUserChange() async {
    if (user == null) {
      await _signOutTask().map((r) => navigate(Paths.LOGIN)).run();
    } else {
      await accountRepo
          .getAccountTask(user!)
          .mapLeft((l) => null)
          .flatMap((account) => storageRepo.saveAccountTask(account).toTaskEither(() => null))
          .map((_) => navigate(Paths.HOME))
          .run();
    }
    DialogAPI().dismissLoading();
  }

  TaskOption<Unit> _signOutTask() {
    return TaskOption.tryCatch(GetStorage().erase)
        .andThen(() => TaskOption.tryCatch(() async => await getIt.resetLazySingleton<HomeController>()))
        .map((r) => unit);
  }
}
