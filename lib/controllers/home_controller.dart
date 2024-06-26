import 'package:signals/signals.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_list/domain/account.dart';
import 'package:todo_list/domain/project.dart';
import 'package:todo_list/infrastructure/models/iprojects_repository.dart';
import 'package:todo_list/infrastructure/models/istorage_repository.dart';

class HomeController {
  final StorageRepository storageRepo;
  final ProjectsRepository projectRepo;
  static final stream = signal<Stream<List<Project>>>(const Stream.empty());
  late final StreamSignal<List<Project>> projectsList = streamSignal(() => stream.value);
  final accountSignal = signal<Account?>(null);

  HomeController(this.storageRepo, this.projectRepo) {
    var task = storageRepo.getAccountTask().map((account) => accountSignal.set(account));
    task.run();
    stream.set(projectRepo.projectStream());
  }
}
