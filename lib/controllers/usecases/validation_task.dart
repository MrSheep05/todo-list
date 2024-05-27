import 'package:fpdart/fpdart.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_list/core/dialog_api.dart';
import 'package:todo_list/domain/objects/index.dart';

TaskEither<String, T> validationTask<T>(ValueObject<T, ValueFailure> object, Signal<bool> setError) {
  return object.getValueTask.mapLeft((failure) {
    DialogAPI().importantSnackbar(failure.message, severity: Severity.warning);
    setError.set(true);
    return failure.message;
  });
}
