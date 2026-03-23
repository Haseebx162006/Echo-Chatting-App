class UserModel {
  final String uid;
  final String name;
  final String email;
  final String profilePictureUrl;
  final bool isOnline;
  final String Statusmsg;
  final DateTime CreatedAt;
  final DateTime LastSeen;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.profilePictureUrl,
    required this.isOnline,
    required this.Statusmsg,
    required this.CreatedAt,
    required this.LastSeen,
  });
  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(uid: map['uid'] ?? "", name: map['name'] ?? "" , email: map['email'] ?? "", profilePictureUrl: map['profilePictureUrl'] ?? "", isOnline: map['isOnline'] ?? false, Statusmsg: map['Statusmsg'] ?? "", CreatedAt: map['CreatedAt'] ?? DateTime.now(), LastSeen: map['LastSeen'] ?? DateTime.now());
  }
}
