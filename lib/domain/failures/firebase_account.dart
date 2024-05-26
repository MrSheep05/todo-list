import 'package:todo_list/domain/objects/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_account.freezed.dart';

@freezed
class AccountRepositoryFailure extends ValueFailure with _$AccountRepositoryFailure {
  const AccountRepositoryFailure._();

  const factory AccountRepositoryFailure.firestoreError() = _FirestoreError;
  const factory AccountRepositoryFailure.modelError() = _ModelError;
  const factory AccountRepositoryFailure.unexpectedError() = _Unexpected;

  @override
  String get message => "";
}
