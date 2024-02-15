import 'package:examen_final_fernandez/models/user.dart';
import 'package:examen_final_fernandez/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;
  RxBool isConfPswVisible = false.obs;
  Rx<User> tempUser = User(
          username: Preferences.tempUsername,
          password: Preferences.tempPassword)
      .obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfPswVisibility() {
    isConfPswVisible.toggle();
  }

  void saveCredencials(String username, String password) {
    Preferences.tempUsername = username;
    Preferences.tempPassword = password;
  }

  void resetCredencials() {
    Preferences.tempUsername = '';
    Preferences.tempPassword = '';
  }
}
