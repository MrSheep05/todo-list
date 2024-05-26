import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/failures/unique_id.dart';

class UniqueId {
  final String value;
  static const minLength = 8;
  const UniqueId._(this.value);

  static Either<UniqueIdFailure, UniqueId> validate(String input) {
    if (input.isEmpty) return left(const UniqueIdFailure.noData());
    return right(UniqueId._(input));
  }
}
