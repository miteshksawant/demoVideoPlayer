import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/screens/login_screen/login_screen.dart';
import 'package:video_player_demo/screens/verification_screen/verification_user_controller.dart';
import 'package:video_player_demo/screens/verification_screen/verification_user_screen.dart';
import 'package:video_player_demo/usage/app_common.dart';
import 'package:video_player_demo/usage/app_prefs.dart';
import 'package:video_player_demo/usage/app_strings.dart';
import 'apple_login_helper.dart';
import 'google_login_helper.dart';

class SocialController extends GetxController {
  UserCredential? userCredential;
  // ProfileScreenController _profileScreenController = Get.find<ProfileScreenController>();

  String get getName =>
      FirebaseAuth.instance.currentUser?.displayName ?? "Name";

  String get getEmail => FirebaseAuth.instance.currentUser?.email ?? "Email";

  String get getPhoneNumber =>
      FirebaseAuth.instance.currentUser?.phoneNumber ?? "phoneNumber";

  String get getImage => FirebaseAuth.instance.currentUser?.photoURL ?? "URL";

  Future<String?> get getIdToken async =>
      await FirebaseAuth.instance.currentUser?.getIdToken();

  String userToken = "";

  Future<void> onGoogleSignUpClick() async {
    await AppCommon.apiCallHandler(
      () async {
        userCredential = await GoogleLoginHelper.login();

        if (userCredential != null) {
          print("getIdToken: ${await userCredential?.user?.getIdToken()}");
          print("uid: ${await userCredential?.user?.uid}");
          debugPrint(
              "user token - ${await userCredential?.user?.getIdToken()}");
          userToken = await userCredential?.user?.getIdToken() ?? "";
          /* await Api.socialLogin(
            LoginWithSocialRequestModel(
              email: userCredential.user?.email,
              loginType: EnumLoginType.GOOGLE.index,
              profileImageUrl: userCredential.user?.photoURL,
            ),
          ); */
        }
      },
      onApiCallSuccess: (responseModel) async {},
      onApiCallFail: (errorMessage) => AppCommon.hideDialog(),
    );
    return;
  }

  Future<void> onAppleSignUpClick() async {
    await AppCommon.apiCallHandler(() async {
      userCredential = await AppleLoginHelper.login();
      if (userCredential?.user?.getIdToken() != null) {
        debugPrint("user token - ${await userCredential?.user?.getIdToken()}");
        debugPrint("user email- ${userCredential?.user?.email}");
        debugPrint("user uid- ${userCredential?.user?.uid}");
        userToken = await userCredential?.user?.getIdToken() ?? "";
        /* return await Api.socialSignIn(
            SocialLoginRequestModel(
                uid: userCredential.user?.uid,
                email: userCredential.user?.email,
                loginType: EnumLoginType.APPLE.index,
                profileImageUrl: userCredential.user?.photoURL,
                fcmToken: await FCMHandler.getFcmToken()),
          ); */
      }
    },
        onApiCallSuccess: (responseModel) async {},
        onApiCallFail: (error) async => AppCommon.hideDialog());
    return;
  }

  Future<bool> onFirebaseVerifyPhoneNumber(String phoneNumber,
      {int? forceResendToken, bool isFromLoginFlow = false}) async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      forceResendingToken: forceResendToken,
      verificationCompleted: (phoneAuthCredential) async {
        Get.log(
            "onFirebaseSignInWithPhoneNumber - verificationCompleted = ${phoneAuthCredential.asMap()}");
        // userCredential.user!.linkWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        Get.log(
            "onFirebaseSignInWithPhoneNumber - verificationFailed = ${error.toString()}");
      },
      codeSent: (verificationId, forceResendingToken) async {
        Get.log(
            "onFirebaseSignInWithPhoneNumber - codeSent - verificationId = ${verificationId.toString()}");
        Get.log(
            "onFirebaseSignInWithPhoneNumber - codeSent - forceResendingToken = ${forceResendingToken.toString()}");

        AppCommon.hideDialog();

        VerifyUserController controller = Get.find<VerifyUserController>();

        controller.forceResendingToken = forceResendingToken;
        controller.verificationId = verificationId;

        print("forceResendToken$forceResendToken");
        if (forceResendToken == null) {
          Get.to(
            () => VerifyUserScreen(
              isFromLoginFlow: isFromLoginFlow,
              phoneNumber: phoneNumber,
            ),
          );
        }
      },
      codeAutoRetrievalTimeout: (verificationId) {
        Get.log(
            "onFirebaseSignInWithPhoneNumber - codeAutoRetrievalTimeout - verificationId = ${verificationId.toString()}");
      },
    );

    /*UserCredential? userCredential =
        await FirebaseLoginHelper.signIn(email, password);*/
    return false;
    // _navigateToScreen(userCredential);
  }

  Future<bool> onFirebaseSignInWithPhoneNumber(
      String smsCode, String verificationId) async {
    Get.log("onFirebaseSignInWithPhoneNumber - smsCode = $smsCode");
    Get.log(
        "onFirebaseSignInWithPhoneNumber - verificationId = $verificationId");
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      print("phoneAuthCredential $phoneAuthCredential");
      print("verificationId $verificationId");
      print("smsCode $smsCode");
      // TODO: Change Google login here with previous login type

      // TODO: Phone number linking with Google
      // userCredential = (await GoogleLoginHelper.login())!;
      // userCredential.user!.linkWithCredential(phoneAuthCredential);

      UserCredential userCredential =  await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      print("userCredential $userCredential");
      return true;
    } catch (e) {
      AppCommon.showToast(msg: AppStrings.wrongOtp);
      return false;
    }
  }

  static logout() async {
    AppPrefs.setIsLoggedIn(false);
    AppPrefs.setToken(null);
    await GoogleLoginHelper.logout();
    await AppleLoginHelper.logout();
    // await FacebookLoginHelper.logout();
    await AppPrefs.onLogout();
    // TODO: Login Screen
    Get.offAll(() => LoginScreen());
    // _profileScreenController.profileData.value = ProfileDataResponseModel();
    return;
  }
}
