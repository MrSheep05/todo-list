import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_list/controllers/usecases/validation_task.dart';
import 'package:todo_list/core/dialog_api.dart';
import 'package:todo_list/domain/objects/index.dart';
import 'package:todo_list/domain/project.dart';
import 'package:todo_list/domain/status.dart';
import 'package:todo_list/infrastructure/models/iprojects_repository.dart';
import 'package:todo_list/routes/paths.dart';

class TaskController {
  final ProjectsRepository projectRepo;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final titleError = signal(false);
  final descriptionError = signal(false);

  TaskController(this.projectRepo);

  Future<void> createProject() async {
    await DialogAPI().showLoading();
    var nameObject = NameObject(titleController.text.trim());
    var descriptionObject = DescriptionObject(descriptionController.text.trim());
    await _createProjectTask(nameObject, descriptionObject).map((_) {
      titleController.clear();
      descriptionController.clear();
      navigate(Paths.HOME);
      DialogAPI().showSnackBar("Task has been added successfuly", severity: Severity.success);
    }).run();
    DialogAPI().dismissLoading();
  }

  TaskEither<String, Unit> _createProjectTask(NameObject nameObject, DescriptionObject descriptionObject) {
    return validationTask(nameObject, titleError)
        .andThen(() => validationTask(descriptionObject, descriptionError))
        .andThen(() => Project.createProject(nameObject, descriptionObject, const TaskStatus.ongoing())
            .toTaskEither(() => "")
            .flatMap((project) => projectRepo.saveProject(project).mapLeft((l) {
                  DialogAPI().importantSnackbar(l.message);
                  return l.message;
                })));
  }
}
