import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/failures/description.dart';
import 'package:todo_list/domain/failures/email.dart';
import 'package:todo_list/domain/failures/name.dart';
import 'package:todo_list/domain/failures/password.dart';
import 'package:todo_list/domain/failures/unique_id.dart';
import 'package:todo_list/domain/validated/description.dart';
import 'package:todo_list/domain/validated/email.dart';
import 'package:todo_list/domain/validated/name.dart';
import 'package:todo_list/domain/validated/password.dart';
import 'package:todo_list/domain/validated/unique_id.dart';
import 'package:uuid/uuid.dart';

class ValueObjectException implements Exception {
  final ValueFailure failure;
  const ValueObjectException(this.failure);
}

class ConvertDomainModelException implements Exception {
  final String message;
  final Object error;
  const ConvertDomainModelException(this.message, this.error);
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

  Either<ValueFailure, Unit> get valueFailureOrUnit {
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

  factory EmailObject.fromNullable(String? input) {
    return input != null ? EmailObject(input) : EmailObject._(left(const EmailFailure.noData()));
  }
  const EmailObject._(this.value);
}

class NameObject extends ValueObject<Name, NameFailure> {
  @override
  final Either<NameFailure, Name> value;

  factory NameObject(String input) {
    return NameObject._(Name.validate(input));
  }

  factory NameObject.fromNullable(String? input) {
    return input != null ? NameObject(input) : NameObject._(left(const NameFailure.noData()));
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

class UniqueIdObject extends ValueObject<UniqueId, UniqueIdFailure> {
  @override
  final Either<UniqueIdFailure, UniqueId> value;

  factory UniqueIdObject() {
    return UniqueIdObject._(UniqueId.validate(const Uuid().v1()));
  }

  factory UniqueIdObject.fromString(String input) {
    return UniqueIdObject._(UniqueId.validate(input));
  }

  factory UniqueIdObject.fromNullable(String? input) {
    return input != null ? UniqueIdObject.fromString(input) : UniqueIdObject._(left(const UniqueIdFailure.noData()));
  }
  const UniqueIdObject._(this.value);
}

class DescriptionObject extends ValueObject<Description, DescriptionFailure> {
  @override
  final Either<DescriptionFailure, Description> value;

  factory DescriptionObject(String input) {
    return DescriptionObject._(Description.validate(input));
  }

  factory DescriptionObject.fromNullable(String? input) {
    return input != null ? DescriptionObject(input) : DescriptionObject._(left(const DescriptionFailure.noData()));
  }
  const DescriptionObject._(this.value);
}
