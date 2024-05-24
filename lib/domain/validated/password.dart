import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/failures/password.dart';

class Password {
  final String value;
  static const minLength = 8;
  const Password._(this.value);

  static Either<PasswordFailure, Password> validate(String input) {
    const passwordRegex = r"""^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$""";
    if (input.isEmpty) return left(PasswordNoData());
    if (input.length < minLength) return left(PasswordTooShort());
    return RegExp(passwordRegex).hasMatch(input) ? right(Password._(input)) : left(PasswordTooWeak());
  }
}
