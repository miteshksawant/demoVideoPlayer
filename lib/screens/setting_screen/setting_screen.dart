import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/screens/setting_screen/setting_screen_controller.dart';
import 'package:video_player_demo/usage/app_colors.dart';
import 'package:video_player_demo/usage/app_const.dart';
import 'package:video_player_demo/usage/app_enum.dart';
import 'package:video_player_demo/usage/app_fonts.dart';
import 'package:video_player_demo/usage/app_strings.dart';
import 'package:video_player_demo/widget/app_text.dart';

class SettingScreen extends StatefulWidget {
  static String id = "/settingScreen";
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingScreenController controller = Get.find<SettingScreenController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: padding8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    AppStrings.theme,
                    style: context.textTheme.subtitle1?.copyWith(
                      fontWeight: AppFontWeight.semiBold,
                    ),
                  ),
                  Obx(
                        () => AnimatedToggleSwitch<EnumThemeMode>.rollingByHeight(
                      current: controller.themeMode.value,
                      values: const [
                        EnumThemeMode.SYSTEM,
                        EnumThemeMode.LIGHT,
                        EnumThemeMode.DARK
                      ],
                      height: 40,
                      onChanged: (value) => controller.changeThemeMode(value),
                      iconBuilder: (value, size, foreground) {
                        if (value == EnumThemeMode.SYSTEM) {
                          return const Icon(Icons.settings);
                        } else if (value == EnumThemeMode.DARK) {
                          return const Icon(Icons.dark_mode);
                        } else {
                          return const Icon(Icons.light_mode);
                        }
                      },
                      indicatorColor: context.isDarkMode
                          ? AppColors.buttonColorDark
                          : AppColors.buttonColor,
                      borderColor: Colors.transparent,
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
