import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/screens/home_screen/home_screen.dart';
import 'package:video_player_demo/screens/login_screen/login_screen.dart';
import 'package:video_player_demo/screens/login_screen/login_screen_controller.dart';
import 'package:video_player_demo/screens/register_screen/register_screen_controller.dart';
import 'package:video_player_demo/usage/app_common.dart';
import 'package:video_player_demo/usage/app_prefs.dart';
import 'package:video_player_demo/usage/social_controller.dart';

class VerifyUserController extends GetxController {
  String? otp, verificationId;
  int? forceResendingToken;
  bool isFromLogin = false;


  RegisterScreenController controller = Get.find<RegisterScreenController>();
  LoginScreenController loginScreenController =
      Get.find<LoginScreenController>();
  SocialController socialController = Get.find<SocialController>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void verify() async {
    if (otp?.length == 6) {
      AppCommon.apiCallHandler<bool>(
        () async {
          bool verificationStatus = await socialController.onFirebaseSignInWithPhoneNumber(
              otp!, verificationId!);
          print("verificationStatus $verificationStatus");
          return verificationStatus;
        },
        onApiCallSuccess: (data) async {
          print("data $data");
          print("test login");
          if (data ?? false) {
            if (isFromLogin) {
              AppPrefs.setIsLoggedIn(true);
              Get.offAll(() => const HomeScreen());
            } else {
              print("else");
              await firestore.collection("users").add({
                "email": controller.email,
                "phone": controller.mobileNumber,
              }).then((value) async {
                AppCommon.showToast(msg: "Register Successfully.");
                Get.offAll(() => const LoginScreen());
              });
            }
          }
        },
        onApiCallFail: (errorMessage) {
          print("errorMessage $errorMessage");
        },
      );
    }
  }

  Future<void> resendOtp() async {
    AppCommon.apiCallHandler<bool>(() async {
      await socialController.onFirebaseVerifyPhoneNumber(
          controller.mobileNumber!,
          forceResendToken: forceResendingToken);
    });
  }
}
