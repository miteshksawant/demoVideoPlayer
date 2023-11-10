import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/screens/login_screen/login_screen.dart';
import 'package:video_player_demo/screens/register_screen/register_screen_controller.dart';
import 'package:video_player_demo/usage/app_colors.dart';
import 'package:video_player_demo/usage/app_common.dart';
import 'package:video_player_demo/usage/app_const.dart';
import 'package:video_player_demo/usage/app_form_validators.dart';
import 'package:video_player_demo/usage/app_strings.dart';
import 'package:video_player_demo/widget/app_button.dart';
import 'package:video_player_demo/widget/app_cached_network_image.dart';
import 'package:video_player_demo/widget/app_text.dart';
import 'package:video_player_demo/widget/app_text_button.dart';
import 'package:video_player_demo/widget/app_text_filed.dart';
import 'package:video_player_demo/widget/my_app_bar.dart';

class RegisterScreen extends StatefulWidget {
  static String id = "/register";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenController controller = Get.find<RegisterScreenController>();
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
                    Get.to(() => const LoginScreen());
                  },
                  title: AppStrings.login.toUpperCase(),
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
                  AppStrings.register.toUpperCase(),
                  style: context.textTheme.headline6,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                AppText(
                  "Enter your email and mobile number",
                  style: Get.textTheme.subtitle1,
                ),
                SizedBox(
                  height: Get.height * 0.045,
                ),
                Form(
                    key: controller.formKey,
                    child: SlideInDown(
                      child: Column(
                        children: [
                          AppTextFiled(
                            upperText: AppStrings.name,
                            hintText: AppStrings.name,
                            validator: (value, _) =>
                                AppFormValidators.validateName(value),
                            onChanged: (value, _) {
                              controller.userName = value;
                            },
                            onSaved: (value, _) => controller.email = value,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: AppColors.grayColor,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          GetBuilder<RegisterScreenController>(
                            id: "birthdate",
                            builder: (controller) {
                              return AppTextFiled(
                                readOnly: true,
                                onTap: () => controller.selectBirthdate(),
                                controller: controller.birthdateController,
                                horizontalContentPadding: 16,
                                upperText: AppStrings.manageAccountBirthday,
                                hintText: AppStrings.manageAccountBirthdayHint,
                                validator: (value, _) =>
                                    AppFormValidators.validateEmpty(value),
                                suffixIcon: const Icon(
                                  Icons.calendar_month,
                                  size: 20,
                                ),
                                onSuffixIconTap: () =>
                                    controller.selectBirthdate(),
                              );
                            },
                          ),
                          gap12,
                          const SizedBox(height: 8.0),
                          AppTextFiled(
                            upperText: AppStrings.email,
                            hintText: AppStrings.emailHint,
                            validator: (value, _) =>
                                AppFormValidators.validateEmail(value),
                            onChanged: (value, _) {
                              controller.email = value;
                            },
                            onSaved: (value, _) => controller.email = value,
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: AppColors.grayColor,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          AppTextFiled(
                            upperText: AppStrings.mobileNumber,
                            hintText: AppStrings.mobileNumberHint,
                            validator: (value, _) =>
                                AppFormValidators.validateMobile(value, _),
                            isPrefixCountryCodePicker: true,
                            initialCountryCode: "IN",
                            onChanged: (value, countryCode) {
                              controller.mobileNumber =
                                  '${countryCode?.dialCode ?? ""} $value';
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
                    onPressed: () => controller.register(),
                    child: AppText(
                      AppStrings.register.toUpperCase(),
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
