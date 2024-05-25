import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/failures/name.dart';

class UniqueId {
  final String value;
  static const minLength = 8;
  const UniqueId._(this.value);

  static Either<NameFailure, UniqueId> validate(String input) {
    if (input.isEmpty) return left(const NameFailure.noData());
    return right(UniqueId._(input));
  }
}
