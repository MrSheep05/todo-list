import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestorePaths on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> get usersCollection => collection("users");
}
