import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/domain/objects/index.dart';
import 'package:todo_list/domain/project.dart';
import 'package:todo_list/domain/status.dart';
import 'package:todo_list/infrastructure/core/converters.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  const ProjectModel._();
  const factory ProjectModel({
    String? id,
    String? title,
    String? description,
    @StringTaskStatusConverter() required TaskStatus status,
    @StringDateTimeConverter() DateTime? timestamp,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

  factory ProjectModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    var data = doc.data()!;
    data.putIfAbsent("id", () => doc.id);
    return ProjectModel.fromJson(data);
  }

  factory ProjectModel.fromDomain(Project project) {
    try {
      return ProjectModel(
          id: project.id,
          title: project.title,
          description: project.description,
          status: project.status,
          timestamp: project.timestamp);
    } catch (e) {
      throw ConvertDomainModelException("ProjectModel.fromDomain error", e);
    }
  }

  Project toDomain() {
    try {
      return Project(UniqueIdObject.fromNullable(id), NameObject.fromNullable(title),
          DescriptionObject.fromNullable(description), status, timestamp!);
    } catch (e) {
      throw ConvertDomainModelException("ProjectModel.toDomain error", e);
    }
  }
}
