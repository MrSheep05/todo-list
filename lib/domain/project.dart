import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/objects/index.dart';
import 'package:todo_list/domain/status.dart';
import 'package:todo_list/domain/validated/description.dart';
import 'package:todo_list/domain/validated/name.dart';
import 'package:todo_list/domain/validated/unique_id.dart';

class Project {
  final UniqueId _id;
  final Name _title;
  final DateTime timestamp;
  final Description _description;
  final TaskStatus status;
  const Project._(this._id, this._title, this._description, this.timestamp, this.status);

  factory Project(UniqueIdObject uniqueIdObject, NameObject nameObject, DateTime timestamp,
      DescriptionObject descriptionObject, TaskStatus status) {
    return uniqueIdObject.valueFailureOrUnit
        .andThen(() => nameObject.valueFailureOrUnit)
        .andThen(() => descriptionObject.valueFailureOrUnit)
        .fold(
            (l) => throw ValueObjectException(l),
            (r) => Project._(uniqueIdObject.getOrCrash(), nameObject.getOrCrash(), descriptionObject.getOrCrash(),
                timestamp, status));
  }

  static TaskOption<Project> createProject(UniqueIdObject uniqueIdObject, NameObject nameObject,
      DescriptionObject descriptionObject, DateTime timestamp, TaskStatus status) {
    return TaskOption.tryCatch(() async => Project(uniqueIdObject, nameObject, timestamp, descriptionObject, status));
  }

  String get id => _id.value;
  String get title => _title.value;
  String get description => _description.value;
}
