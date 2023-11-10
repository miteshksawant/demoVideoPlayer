import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/screens/home_screen/home_screen.dart';
import 'package:video_player_demo/usage/app_common.dart';
import 'package:video_player_demo/usage/app_prefs.dart';
import 'package:video_player_demo/usage/app_strings.dart';
import 'package:video_player_demo/usage/social_controller.dart';

class LoginScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  String? mobileNumber, password;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  SocialController socialController = Get.find<SocialController>();

  void login() {
    print("mobileNumber $mobileNumber");
    AppCommon.formButtonClick<bool>(formKey, () async {
      await firestore.collection("users").get().then((value) async {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
            value.docs;
        String userId = "";
        List<QueryDocumentSnapshot<Map<String, dynamic>>> userData =
            documents.where(
          (element) {
            Map<String, dynamic> user = element.data();
            if (user["phone"] == mobileNumber) {
              userId = element.id;
              return true;
            } else {
              return false;
            }
          },
        ).toList();
        if (userData.isNotEmpty) {
          if (userData[0].data()["phone"] == mobileNumber) {
            AppPrefs.setEmail(userData[0].data()["email"]);
            AppPrefs.setPhoneNumber(userData[0].data()["phone"]);
            AppPrefs.setUserId(userId);
            await socialController.onFirebaseVerifyPhoneNumber(mobileNumber!,
                isFromLoginFlow: true);
          }
        } else {
          AppCommon.showToast(
              msg: "You are not register in system please register");
        }
      });
    });
  }
}
