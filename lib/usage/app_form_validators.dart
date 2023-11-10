import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';
import 'package:video_player_demo/usage/app_strings.dart';

class AppFormValidators {
  static String? emptyFieldValidator(String value) {
    if (value.trim().isEmpty) {
      return 'Please enter valid data';
    } else {
      return null;
    }
  }

  static String? validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern as String);
    // if (!regex.hasMatch(value) || value == null) {
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  static String? validateUsername(String value) {
    if (value.toString().trim() == "") {
      return 'Enter a valid username';
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    if (value.toString().trim() == "") {
      return 'Enter a valid name';
    } else if (value.toString().trim().length > 30) {
      return 'Name must be smaller than 30 characters';
    } else {
      return null;
    }
  }

  static String? validateEmpty(String value) {
    if (value.toString().trim() == "") {
      return 'Enter a valid data';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.toString().trim() == "") return 'Enter a password';
    if (value.length < 8 || value.length > 30) {
      return AppStrings.mustBe830Characters;
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return AppStrings.mustIncludeALetter;
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return AppStrings.mustIncludeNumbers;
    } else if (!value.contains(RegExp(r"[!@#$&*~]"))) {
      return AppStrings.mustIncludeASpecialCharacter;
    } else if (value.contains(RegExp(r"[ ]"))) {
      return AppStrings.mustNotIncludeSpaces;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String value, String password) {
    if (value.toString().trim() == "") return 'Enter a confirm password';
    String? resultOfPasswordValidation = validateEmptyPassword(value);
    if (resultOfPasswordValidation == null) {
      if (value != password) {
        return 'Confirm password is not matching with password';
      } else {
        return null;
      }
    } else {
      return resultOfPasswordValidation;
    }
  }

  static String? validateEmptyPassword(String value) {
    if (value.toString().trim() == "") {
      return "Enter a password";
    } else {
      return null;
    }
  }

  static String? validateMobile(
      String value, CountryCode? countryCode)  {
    Get.log("validateMobile - value = $value");

    /* PhoneNumberUtil phoneNumberUtil = PhoneNumberUtil();

    try {
      bool isValid =
          await phoneNumberUtil.validate(value, regionCode: countryCode?.code);
      if (isValid) {
        return null;
      } else {
        return AppStrings.enterValidMobileNumber;
      }
    } on Exception catch (e) {
      return AppStrings.enterValidMobileNumber;
    } */
    if (!GetUtils.isPhoneNumber(value)) {
      return 'Enter a valid mobile number';
    } else {
      return null;
    }
  }

  static String? validateLength(String value, int length) {
    if (value.toString().trim().length != length) {
      return 'Enter a valid data';
    } else {
      return null;
    }
  }

  static String? validateMinLength(String value, int length) {
    if (value.toString().trim().isEmpty) {
      return 'Enter a valid data';
    } else if (value.toString().trim().length < length) {
      return 'Must be a longer than $length characters';
    } else {
      return null;
    }
  }

  static String? validateMaxLength(String value, int length) {
    if (value.toString().trim().isEmpty) {
      return 'Enter a valid data';
    } else if (value.toString().trim().length > length) {
      return 'Must be a smaller than $length characters';
    } else {
      return null;
    }
  }

  static validateAndSave(
      GlobalKey<FormState> _formKey, Function() onValid) async {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      await onValid();
    } else {
      print('Form is invalid');
    }
  }

  static validateMultipleFormAndSave(
      List<GlobalKey<FormState>> _formKeys, Function() onValid) async {
    List<FormState> forms = [];
    bool isFormValid = true;

    /// get all form states from keys
    _formKeys.forEach((formKey) {
      forms.add(formKey.currentState!);
    });

    /// validate all forms
    for (var form in forms) {
      if (!form.validate()) {
        isFormValid = false;
      }
    }

    if (isFormValid) {
      for (var form in forms) {
        form.save();
      }
      await onValid();
    }

    /*final FormState form = _formKeys.currentState!;
    if (form.validate()) {
      form.save();
      await onValid();
    } else {
      print('Form is invalid');
    }*/
  }

}
