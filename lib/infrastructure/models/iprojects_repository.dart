import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/project.dart';

abstract class ProjectsRepository {
  Stream<List<Project>> getProjects();
  TaskEither<dynamic, Unit> saveProject(Project project);
  TaskEither<dynamic, Unit> updateProjectStatus(Project project);
}
