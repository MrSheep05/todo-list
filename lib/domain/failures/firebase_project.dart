import 'package:todo_list/domain/objects/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_project.freezed.dart';

@freezed
class ProjectRepositoryFailure extends ValueFailure with _$ProjectRepositoryFailure {
  const ProjectRepositoryFailure._();

  const factory ProjectRepositoryFailure.firestoreError() = _FirestoreError;
  const factory ProjectRepositoryFailure.modelError() = _ModelError;
  const factory ProjectRepositoryFailure.unexpectedError() = _Unexpected;

  @override
  String get message => "Error on saving project";
}
