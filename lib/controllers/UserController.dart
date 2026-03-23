import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo/models/UserModel.dart';

class Usercontroller {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<UserModel>> getAllUsers() {
    return _firestore
        .collection('users')
        .snapshots()
        .map(
          (snap) =>
              snap.docs.map((data) => UserModel.fromMap(data.data())).toList(),
        );
  }

  Stream<List<UserModel>> SearchUser(String query) {
    return _firestore
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThan: query + '\uf8ff')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => UserModel.fromMap(doc.data()))
              .toList(),
        );
  }

  Stream<List<UserModel>> StatusUser() {
    return _firestore
        .collection("users")
        .where("Statusmsg", isNotEqualTo: "")
        .snapshots()
        .map(
          (snap) =>
              snap.docs.map((data) => UserModel.fromMap(data.data())).toList(),
        );
  }
}
