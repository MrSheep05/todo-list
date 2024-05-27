import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/domain/status.dart';

class StringDateTimeConverter implements JsonConverter<DateTime?, Object?> {
  const StringDateTimeConverter();

  @override
  DateTime? fromJson(Object? string) {
    return (string as Timestamp?)?.toDate();
  }

  @override
  Object? toJson(DateTime? date) {
    return date != null ? Timestamp.fromDate(date) : FieldValue.serverTimestamp();
  }
}

class StringTaskStatusConverter implements JsonConverter<TaskStatus, String?> {
  const StringTaskStatusConverter();

  @override
  TaskStatus fromJson(String? json) {
    return json != null ? TaskStatus.fromString(json) : const TaskStatus.error();
  }

  @override
  String? toJson(TaskStatus object) {
    return object.toString();
  }
}
