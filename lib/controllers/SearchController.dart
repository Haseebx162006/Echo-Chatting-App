import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Searchcontroller {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<UserModel>> SearchUser(String query) async {
    return await _firestore
        .collection('users')
        .where('displayName', isGreaterThanOrEqualTo: query)
        .where('displayName', isLessThan: query + '\uf8ff')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => UserModel.fromMap(doc.data()))
              .toList(),
        );
  }
}
