import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:echo/models/ChatModel.dart';

class ChatController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Send Message
  Future<void> sendMessage(String receiverId, String message) async {
    if (message.trim().isEmpty) return;

    final String currentUserId = _auth.currentUser!.uid;


    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(
          MessageModel(
            senderId: currentUserId,
            receiverId: receiverId,
            message: message,
            timestamp: DateTime.now(),
          ).toMap(),
        );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String receiverId) {
    final String currentUserId = _auth.currentUser!.uid;
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
