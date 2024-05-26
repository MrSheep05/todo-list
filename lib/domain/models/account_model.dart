import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list/core/storage_keys.dart';
import 'package:todo_list/domain/account.dart';
import 'package:todo_list/domain/objects/index.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel with _$AccountModel {
  const AccountModel._();
  const factory AccountModel({
    String? uid,
    String? username,
    String? email,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);

  factory AccountModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    var data = doc.data()!;
    data.putIfAbsent("id", () => doc.id);
    return AccountModel.fromJson(data);
  }

  factory AccountModel.fromStorage(GetStorage storage) {
    return AccountModel(
        uid: storage.read(StorageKeys.ACCONT_UID),
        username: storage.read(StorageKeys.ACCONT_USERNAME),
        email: storage.read(StorageKeys.ACCONT_EMAIL));
  }

  factory AccountModel.fromCredentials(UserCredential credentials, String username) {
    return AccountModel(uid: credentials.user?.uid, username: username, email: credentials.user?.email);
  }

  factory AccountModel.fromDomain(Account account) {
    try {
      return AccountModel(email: account.email, uid: account.uid, username: account.username);
    } catch (e) {
      throw ConvertDomainModelException("AccountModel.fromDomain error", e);
    }
  }

  Account toDomain() {
    try {
      return Account(
        UniqueIdObject.fromNullable(uid),
        NameObject.fromNullable(username),
        EmailObject.fromNullable(email),
      );
    } catch (e) {
      throw ConvertDomainModelException("AccountModel.toDomain error", e);
    }
  }
}
