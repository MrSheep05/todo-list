import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/infrastructure/models/istorage_repository.dart';

extension FirestorePaths on FirebaseFirestore {
  static final storageRepo = GetIt.instance.get<StorageRepository>();
  CollectionReference<Map<String, dynamic>> get usersCollection => collection("users");
  CollectionReference<Map<String, dynamic>> get projectsCollection => storageRepo.uid.fold(
      () => throw ErrorDescription("UID is not defined yet"),
      (uid) => collection("users").doc(uid).collection("projects"));
}
