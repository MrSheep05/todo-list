import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/objects/index.dart';
import 'package:todo_list/domain/status.dart';
import 'package:todo_list/domain/validated/description.dart';
import 'package:todo_list/domain/validated/name.dart';
import 'package:todo_list/domain/validated/unique_id.dart';

class Project {
  final UniqueId _id;
  final Name _title;
  final DateTime? timestamp;
  final Description _description;
  TaskStatus status;
  Project._(this._id, this._title, this._description, this.timestamp, this.status);

  factory Project(UniqueIdObject uniqueIdObject, NameObject nameObject, DescriptionObject descriptionObject,
      TaskStatus status, DateTime? timestamp) {
    return uniqueIdObject.valueFailureOrUnit
        .andThen(() => nameObject.valueFailureOrUnit)
        .andThen(() => descriptionObject.valueFailureOrUnit)
        .fold(
            (l) => throw ValueObjectException(l),
            (r) => Project._(uniqueIdObject.getOrCrash(), nameObject.getOrCrash(), descriptionObject.getOrCrash(),
                timestamp, status));
  }

  static TaskOption<Project> createProject(
      NameObject nameObject, DescriptionObject descriptionObject, TaskStatus status) {
    return TaskOption.tryCatch(() async => Project(UniqueIdObject(), nameObject, descriptionObject, status, null));
  }

  void updateStatus(TaskStatus status) {
    this.status = status;
  }

  String get id => _id.value;
  String get title => _title.value;
  String get description => _description.value;
}
