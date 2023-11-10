import 'package:argon_buttons_flutter_fix/argon_buttons_flutter.dart';
import 'package:video_player_demo/screens/verification_screen/verification_user_controller.dart';
import 'package:video_player_demo/usage/app_colors.dart';
import 'package:video_player_demo/usage/app_common.dart';
import 'package:video_player_demo/usage/app_const.dart';
import 'package:video_player_demo/usage/app_fonts.dart';
import 'package:video_player_demo/usage/app_strings.dart';

import 'package:video_player_demo/widget/app_button.dart';
import 'package:video_player_demo/widget/app_text.dart';
import 'package:video_player_demo/widget/app_text_button.dart';
import 'package:video_player_demo/widget/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyUserScreen extends StatefulWidget {
  static String id = "/verifyUser";

  final bool? isFromLoginFlow;
  final String? phoneNumber;
  const VerifyUserScreen({Key? key, this.isFromLoginFlow, this.phoneNumber})
      : super(key: key);

  @override
  _VerifyUserScreenState createState() => _VerifyUserScreenState();
}

class _VerifyUserScreenState extends State<VerifyUserScreen> {
  VerifyUserController controller = Get.find<VerifyUserController>();

  @override
  void initState() {
    super.initState();
    controller.isFromLogin = widget.isFromLoginFlow ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleWidget: null,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextButton(
                  onTap: () => Get.back(),
                  title: AppStrings.register.toUpperCase(),
                ),
              ],
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => AppCommon.hideKeyboard(),
        child: Container(
          padding: padding16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gap24,
                      AppText("Verify Otp",
                          style: context.textTheme.headline6),
                      gap4,
                      AppText(
                        "We send one otp to your below regitered mobile number",
                        style: context.textTheme.subtitle1,
                        maxLines: 2,
                      ),
                      gap16,
                      AppText(
                        widget.phoneNumber ?? "",
                        style: context.textTheme.subtitle1?.copyWith(
                            fontSize: 18, fontWeight: AppFontWeight.semiBold),
                      ),
                      gap36,
                      PinCodeTextField(
                        appContext: Get.context!,
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.circle,
                            activeFillColor: AppColors.whiteColor,
                            inactiveColor: Get.isDarkMode
                                ? AppColors.textFieldUnfocusBorderDark
                                : AppColors.textFieldUnfocusBorder,
                            selectedColor: Get.isDarkMode
                                ? AppColors.textFieldFocusBorderDark
                                : AppColors.textFieldFocusBorder),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: false,
                        autoFocus: true,
                        textStyle: context.textTheme.headline5
                            ?.copyWith(fontWeight: AppFontWeight.semiBold),
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {},
                        onChanged: (value) => controller.otp = value,
                        beforeTextPaste: (text) {
                          return true;
                        },
                      ),
                      gap16,
                      Center(
                        child: AppText(
                          AppStrings.didntGetOtp,
                          style: context.textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(
                        width: Get.width,
                        child: ArgonTimerButton(
                          initialTimer: 60,
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.45,
                          minWidth: MediaQuery.of(context).size.width * 0.30,
                          disabledTextColor: AppColors.grayBorderColor,
                          disabledColor: AppColors.grayBorderColor,
                          color: context.isDarkMode
                              ? AppColors.buttonColorDark
                              : AppColors.buttonColor,
                          child: Text(AppStrings.resendOtp,
                              style: context.textTheme.button?.copyWith(
                                  color: context.isDarkMode
                                      ? AppColors.buttonColorDark
                                      : AppColors.buttonColor)),
                          loader: (timeLeft) {
                            return Text(AppStrings.resendOtpIn(timeLeft),
                                style: context.textTheme.button
                                    ?.copyWith(color: AppColors.grayColor));
                          },
                          onTap: (startTimer, btnState) async {
                            if (btnState == ButtonState.Idle) {
                              await controller.resendOtp();
                              startTimer(60);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppButton.widget(
                isFullScreenWidth: true,
                onPressed: () => controller.verify(),
                child: AppText(
                  AppStrings.verifyNow,
                  style: context.textTheme.button
                      ?.copyWith(color: AppColors.whiteColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
