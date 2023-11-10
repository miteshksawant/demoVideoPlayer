import 'package:get/get.dart';
import 'package:video_player_demo/screens/register_screen/register_screen_controller.dart';
import 'package:video_player_demo/screens/setting_screen/setting_screen_controller.dart';
import 'package:video_player_demo/screens/verification_screen/verification_user_controller.dart';
import 'package:video_player_demo/usage/social_controller.dart';

class AppInitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SocialController(),fenix: true);
    Get.lazyPut(() => VerifyUserController());
    Get.lazyPut(() => RegisterScreenController());
    Get.lazyPut(() => SettingScreenController());
  }
}
