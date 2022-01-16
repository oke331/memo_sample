import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> memosRef(String userId) =>
      collection('users').doc(userId).collection('memos');
}
