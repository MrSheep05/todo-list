import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/failures/email.dart';
import 'package:todo_list/domain/validated/email.dart';

class ValueObjectException implements Exception {
  final ValueFailure failure;
  const ValueObjectException(this.failure);
}

abstract class ValueFailure {
  String get message;
}

@immutable
abstract class ValueObject<T, E extends ValueFailure> implements Equatable {
  const ValueObject();

  Either<E, T> get value;

  T getOrCrash() {
    return value.fold(
      (valueFailure) => throw ValueObjectException(valueFailure),
      (r) => r,
    );
  }

  T getOrElse(T elseValue) {
    return value.getOrElse((left) => elseValue);
  }

  T? getOrElseNullable(T? nullable) {
    return value.getRight().toNullable() ?? nullable;
  }

  Either<E, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  List<Object> get props => [value];

  @override
  bool get stringify => true;
}

class EmailObject extends ValueObject<Email, EmailFailure> {
  @override
  final Either<EmailFailure, Email> value;

  factory EmailObject(String input) {
    return EmailObject._(Email.validate(input));
  }

  const EmailObject._(this.value);
}
