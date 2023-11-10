import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/screens/login_screen/login_screen_controller.dart';
import 'package:video_player_demo/screens/register_screen/register_screen.dart';
import 'package:video_player_demo/usage/app_colors.dart';
import 'package:video_player_demo/usage/app_common.dart';
import 'package:video_player_demo/usage/app_const.dart';
import 'package:video_player_demo/usage/app_form_validators.dart';
import 'package:video_player_demo/usage/app_strings.dart';
import 'package:video_player_demo/widget/app_button.dart';
import 'package:video_player_demo/widget/app_text.dart';
import 'package:video_player_demo/widget/app_text_button.dart';
import 'package:video_player_demo/widget/app_text_filed.dart';
import 'package:video_player_demo/widget/my_app_bar.dart';

class LoginScreen extends StatefulWidget {
  static String id = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenController loginScreenController =
      Get.put(LoginScreenController());
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
                  onTap: () {
                    Get.to(() => const RegisterScreen());
                  },
                  title: AppStrings.register.toUpperCase(),
                )
              ],
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => AppCommon.hideKeyboard(),
        child: Container(
          padding: padding16,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.01,
                ),
                AppText(
                  AppStrings.login.toUpperCase(),
                  style: context.textTheme.headline6,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                AppText(
                  "Enter your mobile number",
                  style: Get.textTheme.subtitle1,
                ),
                SizedBox(
                  height: Get.height * 0.045,
                ),
                Form(
                    key: loginScreenController.formKey,
                    child: SlideInDown(
                      child: Column(
                        children: [
                          AppTextFiled(
                            upperText: AppStrings.mobileNumber,
                            hintText: AppStrings.mobileNumberHint,
                            validator: (value, _) =>
                                AppFormValidators.validateMobile(value, _),
                            isPrefixCountryCodePicker: true,
                            initialCountryCode: "IN",
                            onChanged: (value, countryCode){
                              print('value :$value');
                              loginScreenController.mobileNumber = '${countryCode?.dialCode ?? ""} $value';
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: Get.height * 0.045,
                ),
                SlideInUp(
                  child: AppButton.widget(
                    onPressed: () => loginScreenController.login(),
                    child: AppText(
                      AppStrings.login.toUpperCase(),
                      style: context.textTheme.button
                          ?.copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
