import 'package:echo/controllers/UserController.dart';
import 'package:echo/models/UserModel.dart';

import 'package:riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';

final searchProvider = StateProvider<String>((ref) {
  return "";
});

final userController = Provider((ref) {
  return Usercontroller();
});

final userProvider = StreamProvider<List<UserModel>>((ref) {
  final user = ref.watch(userController);
  final search = ref.watch(searchProvider);

  if (search.isEmpty) {
    return user.getAllUsers();
  } else {
    return user.SearchUser(search);
  }
});

final statusProvider = StreamProvider<List<UserModel>>((ref) {
  final user = ref.watch(userController);
  return user.StatusUser();
});
