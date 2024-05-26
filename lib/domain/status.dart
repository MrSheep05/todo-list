import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
class TaskStatus with _$TaskStatus {
  const TaskStatus._();
  const factory TaskStatus.completed() = _Completed;
  const factory TaskStatus.ongoing() = _Ongoing;
  const factory TaskStatus.inProcess() = inProcess;
  const factory TaskStatus.canceled() = Canceled;
  const factory TaskStatus.error() = _Error;

  static const Map<String, TaskStatus> _jsonMap = {
    'completed': TaskStatus.completed(),
    'ongoing': TaskStatus.ongoing(),
    'in_process': TaskStatus.inProcess(),
    'canceled': TaskStatus.canceled(),
    'error': TaskStatus.error()
  };

  factory TaskStatus.fromString(String status) => _jsonMap[status] ?? const TaskStatus.error();

  @override
  String toString() {
    return _jsonMap.keys.firstWhere((element) => _jsonMap[element] == this, orElse: () => "error");
  }

  IconData get icon => map(
      completed: (_) => Icons.check_rounded,
      ongoing: (_) => Icons.cached_rounded,
      inProcess: (_) => Icons.access_time_rounded,
      canceled: (_) => Icons.close_rounded,
      error: (_) => Icons.error_outline);

  Color get iconColor => maybeMap(
      ongoing: (_) => const Color(0xFF4C85DA),
      inProcess: (_) => const Color(0xFFE5AF40),
      orElse: () => const Color(0xFFDA634D),
      completed: (_) => const Color(0xFF4AAFB1));

  Color get backgroundColor => maybeMap(
      ongoing: (_) => const Color(0xFF5693F2),
      inProcess: (_) => const Color(0xFFFEC247),
      orElse: () => const Color(0xFFF26E56),
      completed: (_) => const Color(0xFF53C2C5));

  String get text => map(
      completed: (_) => "Completed",
      ongoing: (_) => "Ongoing",
      inProcess: (_) => "In Process",
      canceled: (_) => "Canceled",
      error: (_) => "Error");
}
