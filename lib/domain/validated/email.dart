import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/failures/email.dart';

class Email {
  final String value;
  const Email._(this.value);

  static Either<EmailFailure, Email> validate(String input) {
    const emailRegex = r"""^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$""";
    if (input.isEmpty) return left(const EmailFailure.noData());
    return RegExp(emailRegex).hasMatch(input) ? right(Email._(input)) : left(const EmailFailure.invalidString());
  }
}
