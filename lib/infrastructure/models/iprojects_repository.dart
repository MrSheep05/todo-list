import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/failures/firebase_project.dart';
import 'package:todo_list/domain/project.dart';

abstract class ProjectsRepository {
  Stream<List<Project>> getProjects();
  TaskEither<ProjectRepositoryFailure, Unit> saveProject(Project project);
  TaskEither<ProjectRepositoryFailure, Unit> updateProjectStatus(Project project);
}
