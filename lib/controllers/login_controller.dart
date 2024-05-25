import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:signals/signals.dart';
import 'package:todo_list/controllers/usecases/sign_in_task.dart';
import 'package:todo_list/core/dialog_api.dart';
import 'package:todo_list/domain/objects/index.dart';

class LoginController {
  final loginError = signal<bool>(false);
  final passwordError = signal<bool>(false);
  final usernameError = signal<bool>(false);
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final auth = FirebaseAuth.instance;

  LoginController();

  Future<void> signIn() async {
    await DialogAPI().showLoading();
    var emailObject = EmailObject(loginController.text.trim());
    var passwordObject = PasswordObject(passwordController.text);
    await _signInTask(emailObject, passwordObject).map((_) {
      loginController.clear();
      passwordController.clear();
    }).run();
    DialogAPI().dismissLoading();
  }

  Future<void> registerIn() async {
    await DialogAPI().showLoading();
    var emailObject = EmailObject(loginController.text.trim());
    var passwordObject = PasswordObject(passwordController.text);
    var nameObject = NameObject(usernameController.text.trim());
    await _registerInTask(nameObject, emailObject, passwordObject).map((_) {
      loginController.clear();
      passwordController.clear();
      usernameController.clear();
    }).run();
    DialogAPI().dismissLoading();
  }

  TaskEither<String, void> _registerInTask(
      NameObject nameObject, EmailObject emailObject, PasswordObject passwordObject) {
    return _validationTask(nameObject, usernameError).flatMap((username) => _validationTask(emailObject, loginError)
        .flatMap((email) => _validationTask(passwordObject, passwordError)
            .flatMap((password) => auth.registerInTask(email, password).mapLeft((l) {
                      DialogAPI().importantSnackbar(l);
                      return l;
                    })
                // .flatMap((userCredentials) => )
                )));
  }

  TaskEither<String, void> _signInTask(EmailObject emailObject, PasswordObject passwordObject) {
    return _validationTask(emailObject, loginError).flatMap((email) => _validationTask(passwordObject, passwordError)
            .flatMap((password) => auth.signInTask(email, password))
            .mapLeft((l) {
          DialogAPI().importantSnackbar(l);
          return l;
        }));
  }

  TaskEither<String, T> _validationTask<T>(ValueObject<T, ValueFailure> object, Signal<bool> setError) {
    return object.getValueTask.mapLeft((failure) {
      DialogAPI().importantSnackbar(failure.message, severity: Severity.warning);
      setError.set(true);
      return failure.message;
    });
  }
}
