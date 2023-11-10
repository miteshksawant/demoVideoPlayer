import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/usage/app_enum.dart';
import 'package:video_player_demo/usage/app_prefs.dart';

class SettingScreenController extends GetxController{

  Rx<EnumThemeMode> themeMode = (AppPrefs.isSystemDefaultMode
      ? EnumThemeMode.SYSTEM
      : AppPrefs.isDarkMode
      ? EnumThemeMode.DARK
      : EnumThemeMode.LIGHT)
      .obs;

  void changeThemeMode(EnumThemeMode mode) {
    if (mode == EnumThemeMode.SYSTEM) {
      themeMode.value = mode;
      Get.changeThemeMode(ThemeMode.system);
      AppPrefs.setIsSystemDefaultMode(true);
    } else if (mode == EnumThemeMode.DARK) {
      themeMode.value = mode;
      Get.changeThemeMode(ThemeMode.dark);
      AppPrefs.setIsSystemDefaultMode(false);
      AppPrefs.setIsDarkMode(true);
    } else if (mode == EnumThemeMode.LIGHT) {
      themeMode.value = mode;
      Get.changeThemeMode(ThemeMode.light);
      AppPrefs.setIsSystemDefaultMode(false);
      AppPrefs.setIsDarkMode(false);
    }
  }
  }