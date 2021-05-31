
import 'dart:io';

import 'package:like_us/models/User.dart';
import 'package:like_us/repository/user_repository.dart';
import 'package:like_us/store/state_keeper.dart';

class UserStore extends StateKeeper {
  UserStore._();
  static UserStore _instance = UserStore._();
  factory UserStore() => _instance;

  static const String CURR_USER = 'curr_user';

  UserRepository _userRepository = UserRepository();

  User currUser;
  List<User> allOtherUsers;

  Future fetchCurrentUser() async {
    currUser = await _userRepository.getCurrUser();
    notifyListeners();
  }

  Future fetchAllOtherUsers() async {
    allOtherUsers = await _userRepository.getAllOtherUses();
    notifyListeners();
  }

  // Future updateProfileImage({File image, String key}) async {
  //   await _userRepository.updateProfileImage(image, key);
  // }
}
