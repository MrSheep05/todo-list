import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:todo_list/core/firestore_paths.dart';
import 'package:todo_list/domain/account.dart';
import 'package:todo_list/domain/failures/firebase_account.dart';
import 'package:todo_list/domain/models/account_model.dart';
import 'package:todo_list/infrastructure/models/iuser_repository.dart';

class FirebaseAccountRepo extends AccountRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  TaskEither<AccountRepositoryFailure, Account> getAccountTask(User user) {
    return TaskEither.tryCatch(
        _firestore.usersCollection.doc(user.uid).get,
        (error, stackTrace) => error is FirebaseException
            ? const AccountRepositoryFailure.firestoreError()
            : const AccountRepositoryFailure.unexpectedError()).flatMap((doc) => TaskEither.tryCatch(
        () async => AccountModel.fromFirestore(doc).toDomain(),
        (error, stackTrace) => const AccountRepositoryFailure.modelError()));
  }

  @override
  TaskEither<AccountRepositoryFailure, Unit> saveAccountTask(Account user) {
    return TaskEither.tryCatch(() async => AccountModel.fromDomain(user),
            (error, stackTrace) => const AccountRepositoryFailure.modelError())
        .flatMap((userModel) => TaskEither.tryCatch(
            () async => await _firestore.usersCollection.doc(user.uid).set(userModel.toJson()),
            (error, stackTrace) => error is FirebaseException
                ? const AccountRepositoryFailure.firestoreError()
                : const AccountRepositoryFailure.unexpectedError()))
        .map((_) => unit);
  }
}
