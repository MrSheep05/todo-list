import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/domain/status.dart';
import 'package:todo_list/infrastructure/core/date_time.dart';

class StringDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const StringDateTimeConverter();

  @override
  DateTime? fromJson(String? string) {
    if (string is String) {
      return DateTime.parse(string);
    } else {
      return null;
    }
  }

  @override
  String? toJson(DateTime? date) {
    return date?.toDateTimeString();
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
