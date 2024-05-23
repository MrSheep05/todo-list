import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:todo_list/core/dialog_api.dart';
import 'package:todo_list/domain/auth_exception_status.dart';
import 'package:todo_list/domain/failures/email.dart';
import 'package:todo_list/domain/objects/index.dart';
import 'package:todo_list/domain/validated/email.dart';

class LoginController {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final auth = FirebaseAuth.instance;

  LoginController();

  Future<void> signIn() async {
    await DialogAPI().showLoading();
    var emailObject = EmailObject(loginController.text.trim());

    if (emailObject.failureOrUnit.isLeft()) {
      emailObject.failureOrUnit.mapLeft((failure) => DialogAPI().importantSnackbar(
          switch (failure) {
            NoData() => "Login nie moe być pusty",
            InvalidString() => "Login musi być emailem",
          },
          severity: Severity.warning));
      DialogAPI().dismissLoading();
      return;
    }

    var email = emailObject.getOrCrash();
    if (passwordController.text.trim().isEmpty) {
      DialogAPI().importantSnackbar("Login nie może być pusty", severity: Severity.warning);
      DialogAPI().dismissLoading();
      return;
    }
    await signInTask(email).run();
    DialogAPI().dismissLoading();
  }

  Task<void> signInTask(Email email) {
    return TaskEither.tryCatch(
        () async => await auth.signInWithEmailAndPassword(email: email.value, password: passwordController.text.trim()),
        (error, stackTrace) {
      print("ERROR, ${error is FirebaseAuthException ? error.code : "NULL"}");
      return error is FirebaseAuthException ? AuthExceptionStatus.getStatus(error.code) : AuthExceptionStatus.Undefined;
    }).match((l) {
      print(l);
      DialogAPI().importantSnackbar(l.message);
    }, (r) => {});
  }
}
