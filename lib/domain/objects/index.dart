import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/failures/email.dart';
import 'package:todo_list/domain/failures/name.dart';
import 'package:todo_list/domain/failures/password.dart';
import 'package:todo_list/domain/validated/email.dart';
import 'package:todo_list/domain/validated/name.dart';
import 'package:todo_list/domain/validated/password.dart';
import 'package:todo_list/domain/validated/unique_id.dart';
import 'package:uuid/uuid.dart';

class ValueObjectException implements Exception {
  final ValueFailure failure;
  const ValueObjectException(this.failure);
}

abstract class ValueFailure {
  const ValueFailure();
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

  TaskEither<E, T> get getValueTask => TaskEither.fromEither(value);

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

class NameObject extends ValueObject<Name, NameFailure> {
  @override
  final Either<NameFailure, Name> value;

  factory NameObject(String input) {
    return NameObject._(Name.validate(input));
  }

  const NameObject._(this.value);
}

class PasswordObject extends ValueObject<Password, PasswordFailure> {
  @override
  final Either<PasswordFailure, Password> value;

  factory PasswordObject(String input) {
    return PasswordObject._(Password.validate(input));
  }

  const PasswordObject._(this.value);
}

class UniqueIdObject extends ValueObject<UniqueId, ValueFailure> {
  @override
  final Either<ValueFailure, UniqueId> value;

  factory UniqueIdObject() {
    return UniqueIdObject._(UniqueId.validate(const Uuid().v1()));
  }

  factory UniqueIdObject.fromString(String input) {
    return UniqueIdObject._(UniqueId.validate(input));
  }

  const UniqueIdObject._(this.value);
}
