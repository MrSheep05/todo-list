import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/failures/name.dart';

class Name {
  final String value;
  static const maxLength = 50;
  static const minLength = 5;
  const Name._(this.value);

  static Either<NameFailure, Name> validate(String input) {
    if (input.isEmpty) return left(const NameFailure.noData());
    if (input.length > maxLength) return left(const NameFailure.tooLong());
    if (input.length < minLength) return left(const NameFailure.tooShort());
    return right(Name._(input));
  }
}
