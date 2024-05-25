import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:todo_list/domain/auth_exception_status.dart';
import 'package:todo_list/domain/validated/email.dart';
import 'package:todo_list/domain/validated/password.dart';

extension FirebaseAuthSignIn on FirebaseAuth {
  TaskEither<String, UserCredential> signInTask(Email email, Password password) {
    return TaskEither.tryCatch(
        () async => await signInWithEmailAndPassword(email: email.value, password: password.value),
        (error, stackTrace) => error is FirebaseAuthException
            ? AuthExceptionStatus.getStatus(error.code)
            : AuthExceptionStatus.Undefined).mapLeft((l) => l.signInMessage);
  }

  TaskEither<String, UserCredential> registerInTask(Email email, Password password) {
    return TaskEither.tryCatch(
        () async => createUserWithEmailAndPassword(email: email.value, password: password.value),
        (error, stackTrace) => error is FirebaseAuthException
            ? AuthExceptionStatus.getStatus(error.code)
            : AuthExceptionStatus.Undefined).mapLeft((l) => l.registerInMessage);
  }
}
