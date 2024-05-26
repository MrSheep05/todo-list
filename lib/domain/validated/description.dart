import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/failures/description.dart';

class Description {
  final String value;
  static const maxLength = 200;
  static const minLength = 3;
  const Description._(this.value);

  static Either<DescriptionFailure, Description> validate(String input) {
    if (input.isEmpty) return left(const DescriptionFailure.noData());
    if (input.length > maxLength) return left(const DescriptionFailure.tooLong());
    if (input.length < minLength) return left(const DescriptionFailure.tooShort());
    return right(Description._(input));
  }
}
