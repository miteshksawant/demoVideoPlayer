import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/usage/app_colors.dart';

class AppCountryPicker extends StatefulWidget {
  final String? initialCountry;
  final Function(CountryCode newValue)? onChanged;
  final Function(CountryCode country) onInit;
  final double? width;

  const AppCountryPicker(
      {Key? key,
      this.initialCountry,
      this.onChanged,
      this.width,
      required this.onInit})
      : super(key: key);

  @override
  State<AppCountryPicker> createState() => _AppCountryPickerState();
}

class _AppCountryPickerState extends State<AppCountryPicker> {
  String? selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? Get.width,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(
            color: Get.isDarkMode
                ? AppColors.textFieldUnfocusBorderDark
                : AppColors.textFieldUnfocusBorder),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: CountryCodePicker(
        onChanged: (value) {
          Get.log(
              "CountryPicker - onChanged - value = ${value.code.toString()}");
          selectedCountry = value.code;
          widget.onChanged != null ? widget.onChanged!(value) : null;
          Get.log(
              "CountryPicker - onChanged - selectedCountry = ${selectedCountry.toString()}");
        },
        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
        initialSelection: widget.initialCountry ?? 'AE',
        onInit: (value) {
          selectedCountry = value!.code;
          widget.onInit(value);
        },
        dialogBackgroundColor: Get.isDarkMode
            ? AppColors.scaffoldBackgroundDark
            : AppColors.scaffoldBackgroundLight,
        showFlag: true,
        showDropDownButton: true,
        showCountryOnly: true,
        showOnlyCountryWhenClosed: true,
        showFlagMain: true,
        textStyle: context.textTheme.bodyText1,
        searchStyle: context.textTheme.bodyText1,
        searchDecoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Get.isDarkMode
                    ? AppColors.textFieldFocusBorderDark
                    : AppColors.textFieldFocusBorder),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Get.isDarkMode
                    ? AppColors.textFieldUnfocusBorderDark
                    : AppColors.textFieldUnfocusBorder),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Get.isDarkMode
                    ? AppColors.textFieldUnfocusBorderDark
                    : AppColors.textFieldUnfocusBorder),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
        ),
        favorite: const ['+971', 'AE', '+49', 'DE'],
        alignLeft: true,
      ),
    );
  }
}
