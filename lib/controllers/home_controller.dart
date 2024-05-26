import 'package:signals/signals.dart';
import 'package:todo_list/domain/account.dart';
import 'package:todo_list/infrastructure/models/istorage.repository.dart';

class HomeController {
  final StorageRepository storageRepo;
  final accountSignal = signal<Account?>(null);

  HomeController(this.storageRepo) {
    var task = storageRepo.getAccountTask().map((account) => accountSignal.set(account));
    task.run();
  }
}
