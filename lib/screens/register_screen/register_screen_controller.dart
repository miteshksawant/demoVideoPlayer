import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/screens/verification_screen/verification_user_screen.dart';
import 'package:video_player_demo/usage/app_colors.dart';
import 'package:video_player_demo/usage/app_common.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player_demo/usage/social_controller.dart';
import 'package:image_picker/image_picker.dart';
class RegisterScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();

  String? userName, email, mobileNumber;
  String? name, mobile, country;
  DateTime? birthdate;
  TextEditingController birthdateController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  SocialController socialController = Get.find<SocialController>();

  void register() {
    print(" register mobileNumber: $mobileNumber");
    AppCommon.formButtonClick<bool>(
      formKey,
      () async {
        return await socialController.onFirebaseVerifyPhoneNumber(mobileNumber!);
      },
    );
  }

  void selectBirthdate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: birthdate != null ? birthdate! : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.themeColor,
              onSurface: AppColors.blackColor,
            ),
            buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.light(
                primary: AppColors.themeColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != birthdate) {
      birthdate = picked;
      birthdateController.text =
          AppCommon.formatDateFromEpoch(dateTime: birthdate!);
      update(['birthdate']);
    }
  }
}


