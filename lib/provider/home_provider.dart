import 'package:chat/models/user_model.dart';
import 'package:chat/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class Homeprovider extends ChangeNotifier {
  Homeprovider() {
    getUser();
  }

  UserRepository userRepository = UserRepository();
  Box<UserModel>? data;
  bool isLoading = false;
  String error = "";

  void getUser() async {
    isLoading = true;
    notifyListeners();
    await userRepository.getData().then((dynamic response) {
      if (response is Box<UserModel>) {
        isLoading = false;
        data = response;
        notifyListeners();
      } else {
        isLoading = false;
        error = response;
        notifyListeners();
      }
    });
  }

  void editElementTitle(int index, String newValue) async {
    await userRepository.editElement(index, newValue);
    notifyListeners();
  }

  void deleteElement(int index) async {
    await userRepository.deleteElement(index);
    notifyListeners();
  }
}
