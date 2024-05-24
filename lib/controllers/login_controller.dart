import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:signals/signals.dart';
import 'package:todo_list/core/dialog_api.dart';
import 'package:todo_list/domain/auth_exception_status.dart';
import 'package:todo_list/domain/failures/email.dart';
import 'package:todo_list/domain/failures/password.dart';
import 'package:todo_list/domain/objects/index.dart';
import 'package:todo_list/domain/validated/email.dart';
import 'package:todo_list/domain/validated/password.dart';

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
    var signTask = emailObject.getValueTask.mapLeft<ValueFailure>((failure) {
      DialogAPI().importantSnackbar(
          switch (failure) {
            EmailNoData() => "Login nie może być pusty",
            EmailInvalidString() => "Login musi być emailem",
          },
          severity: Severity.warning);
      loginError.set(true);
      return failure;
    }).flatMap((email) => passwordObject.getValueTask.mapLeft((failure) {
          DialogAPI().importantSnackbar(
              switch (failure) {
                PasswordNoData() => "Hasło nie może być puste",
                PasswordTooWeak() => "Hasło jest za słabe",
                PasswordTooShort() => "Hasło musi mieć co najmniej 8 znaków",
              },
              severity: Severity.warning);
          passwordError.set(true);
          return failure;
        }).flatMap((password) => TaskEither.fromTask(signInTask(email, password))));
    await signTask.run();
    DialogAPI().dismissLoading();
  }

  Task<void> signInTask(Email email, Password password) {
    return TaskEither.tryCatch(
        () async => await auth.signInWithEmailAndPassword(email: email.value, password: password.value),
        (error, stackTrace) {
      print("ERROR, ${error is FirebaseAuthException ? error.code : "NULL"}");
      return error is FirebaseAuthException ? AuthExceptionStatus.getStatus(error.code) : AuthExceptionStatus.Undefined;
    }).match((l) {
      print(l);
      DialogAPI().importantSnackbar(l.message);
    }, (r) => {});
  }
}
