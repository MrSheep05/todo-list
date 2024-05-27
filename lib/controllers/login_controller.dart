import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:signals/signals.dart';
import 'package:todo_list/controllers/usecases/sign_in_task.dart';
import 'package:todo_list/controllers/usecases/validation_task.dart';
import 'package:todo_list/core/dialog_api.dart';
import 'package:todo_list/domain/models/account_model.dart';
import 'package:todo_list/domain/objects/index.dart';
import 'package:todo_list/infrastructure/models/iuser_repository.dart';

class LoginController {
  final AccountRepository accountRepo;

  final loginError = signal<bool>(false);
  final passwordError = signal<bool>(false);
  final usernameError = signal<bool>(false);
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final auth = FirebaseAuth.instance;
  LoginController(this.accountRepo);

  Future<void> signIn() async {
    await DialogAPI().showLoading();
    var emailObject = EmailObject(loginController.text.trim());
    var passwordObject = PasswordObject(passwordController.text);
    await _signInTask(emailObject, passwordObject).mapLeft((l) => DialogAPI().dismissLoading()).map((_) {
      loginController.clear();
      passwordController.clear();
    }).run();
  }

  Future<void> registerIn() async {
    await DialogAPI().showLoading();
    var emailObject = EmailObject(loginController.text.trim());
    var passwordObject = PasswordObject(passwordController.text);
    var nameObject = NameObject(usernameController.text.trim());
    await _registerInTask(nameObject, emailObject, passwordObject)
        .mapLeft((l) => DialogAPI().dismissLoading())
        .map((_) {
      loginController.clear();
      passwordController.clear();
      usernameController.clear();
    }).run();
  }

  TaskEither<String, void> _registerInTask(
      NameObject nameObject, EmailObject emailObject, PasswordObject passwordObject) {
    return validationTask(nameObject, usernameError).flatMap((username) =>
        validationTask(emailObject, loginError)
            .flatMap(
                (email) =>
                    validationTask(passwordObject, passwordError).flatMap((password) => auth
                            .registerInTask(email, password)
                            .mapLeft((l) {
                          DialogAPI().importantSnackbar(l);
                          return l;
                        }).flatMap((userCredentials) => TaskEither.tryCatch(
                                () async => AccountModel.fromCredentials(userCredentials, username.value).toDomain(),
                                (error, s) =>
                                    "").flatMap((account) => accountRepo.saveAccountTask(account).mapLeft((l) {
                                  DialogAPI().importantSnackbar("Problem z stworzeniem konta w bazie");
                                  return l.message;
                                }))))));
  }

  TaskEither<String, void> _signInTask(EmailObject emailObject, PasswordObject passwordObject) {
    return validationTask(emailObject, loginError).flatMap((email) => validationTask(passwordObject, passwordError)
            .flatMap((password) => auth.signInTask(email, password))
            .mapLeft((l) {
          DialogAPI().importantSnackbar(l);
          return l;
        }));
  }
}
