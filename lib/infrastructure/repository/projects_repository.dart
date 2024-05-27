import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:todo_list/core/firestore_paths.dart';
import 'package:todo_list/domain/failures/firebase_project.dart';
import 'package:todo_list/domain/models/project_model.dart';
import 'package:todo_list/domain/project.dart';
import 'package:todo_list/infrastructure/models/iprojects_repository.dart';

class FirebaseProjectsRepo extends ProjectsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Stream<List<Project>> projectStream() {
    return _firestore.projectsCollection.snapshots().map((event) => event.docs.fold(<Project>[], (all, element) {
          try {
            all.add(ProjectModel.fromFirestore(element).toDomain());
          } catch (_) {}
          return all;
        }));
  }

  @override
  TaskEither<ProjectRepositoryFailure, Unit> saveProject(Project project) {
    return TaskEither.tryCatch(() async => ProjectModel.fromDomain(project),
            (error, stackTrace) => const ProjectRepositoryFailure.modelError())
        .flatMap((projectModel) => TaskEither.tryCatch(
            () async => await _firestore.projectsCollection.doc(project.id).set(projectModel.toJson()),
            (e, s) => e is FirebaseException
                ? const ProjectRepositoryFailure.firestoreError()
                : const ProjectRepositoryFailure.unexpectedError()))
        .map((_) => unit);
  }

  @override
  TaskEither<ProjectRepositoryFailure, Unit> updateProjectStatus(Project project) {
    return TaskEither.tryCatch(() async => ProjectModel.fromDomain(project),
            (error, stackTrace) => const ProjectRepositoryFailure.modelError())
        .flatMap((projectModel) => TaskEither.tryCatch(
            () async => await _firestore.projectsCollection.doc(project.id).update(
                Map.fromEntries([projectModel.toJson().entries.firstWhere((element) => element.key == "status")])),
            (e, s) => e is FirebaseException
                ? const ProjectRepositoryFailure.firestoreError()
                : const ProjectRepositoryFailure.unexpectedError()))
        .map((_) => unit);
  }
}
