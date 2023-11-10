import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/usage/app_colors.dart';
import 'package:video_player_demo/usage/app_common.dart';

enum EnumAppTextFiledStyle { rounded, normal }

class AppTextFiled extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffixIconObscured;
  final String? upperText;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final bool? isPrefix;

  final String? Function(String newValue, CountryCode? countryCode)? onSaved;
  final Function(String value, CountryCode? countryCode)? onChanged;
  final Function(String value, CountryCode? countryCode)? validator;
  final Function(CountryCode value)? onCountryCodeChanged;

  /*final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;*/

  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  final TextEditingController? controller;
  final String? initialValue;
  final String? initialCountryCode;
  final bool? showCursor;
  final bool obscureText;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? canUserType;
  final Function(String)? onSubmitted;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool? readOnly;
  final bool? enableSuggestions;
  final bool? enabled;
  final Function()? onSuffixIconTap;
  final int? maxLines;
  final double? hintTextSize;
  final double? horizontalContentPadding;
  final double verticalPadding;
  final double? prefixIconPadding;
  final double? suffixIconPadding;
  final bool isPrefixCountryCodePicker;
  final Color? backgroundColor;
  final EnumAppTextFiledStyle appTextFiledStyle;

  const AppTextFiled(
      {Key? key,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixIconObscured,
      this.upperText,
      this.labelText,
      this.hintText,
      this.errorText,
      this.onChanged,
      this.validator,
      this.onTap,
      this.controller,
      this.initialValue,
      this.initialCountryCode,
      this.showCursor,
      this.isPrefix,
      this.obscureText = false,
      this.textCapitalization = TextCapitalization.none,
      this.textInputAction = TextInputAction.next,
      this.keyboardType,
      this.canUserType = true,
      this.inputFormatters,
      this.onSubmitted,
      this.maxLength,
      this.focusNode,
      this.readOnly,
      this.enableSuggestions = true,
      this.onSuffixIconTap,
      this.onSaved,
      this.enabled = true,
      this.maxLines = 1,
      this.hintTextSize = 16,
      this.horizontalContentPadding = 0,
      this.verticalPadding = 2,
      this.prefixIconPadding = 12,
      this.suffixIconPadding = 16,
      this.isPrefixCountryCodePicker = false,
      this.backgroundColor,
      this.appTextFiledStyle = EnumAppTextFiledStyle.rounded,
      this.onCountryCodeChanged})
      : super(key: key);

  @override
  _AppTextFiledState createState() => _AppTextFiledState();
}

class _AppTextFiledState extends State<AppTextFiled> {
  // FocusNode _focusNode = FocusNode();
  CountryCode? selectedCountryCode;

  bool get isAppTextFieldStyleNormal =>
      widget.appTextFiledStyle == EnumAppTextFiledStyle.normal;
  late bool obscureText;

  List<TextInputFormatter>? inputFormatters;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
    inputFormatters = widget.inputFormatters;
    if (notNull(inputFormatters)) {
      inputFormatters!.add(FilteringTextInputFormatter.deny(
        RegExp(r'[<^>]'),
      ));
    } else {
      List<TextInputFormatter> formatter = [
        FilteringTextInputFormatter.deny(
          RegExp(r'[<^>]'),
        )
      ];
      inputFormatters = formatter;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.upperText != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                  child: Column(
                    children: [
                      Text(
                        widget.upperText ?? "",
                        style: /* TextStyle(
                          fontSize: 12,
                          fontWeight: AppFontWeight.regular,
                          color: const Color(0xff9A9A9A),
                        ) */
                            context.textTheme.subtitle2?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                )
              : Container(),
          GestureDetector(
            onTap: () => widget.enabled ?? false
                ? widget.onTap!() ?? Get.log("App text filed - onTap is null")
                : Get.log("App text filed - onTap is null"),
            child: Material(
              elevation: isAppTextFieldStyleNormal ? 0 : 0,
              // borderRadius: BorderRadius.circular(100),
              color: Colors.transparent,
              shadowColor: AppColors.backgroundShadow.withOpacity(0.2),
              child: Container(
                // margin: const EdgeInsets.symmetric(vertical: 5.0),
                color: Colors.transparent,
                /*decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: AppColors.backgroundShadow.withOpacity(0.2),
                      spreadRadius: -5,
                    )
                  ],
                ),*/
                height: widget.maxLines != 1 ? widget.maxLines! * 24.0 : null,
                alignment: Alignment.center,
                child: TextFormField(
                  maxLines: widget.maxLines,
                  keyboardType: widget.keyboardType,
                  initialValue: widget.initialValue,
                  style: /* TextStyle(
                    color: Colors.black,
                    fontWeight: AppFontWeight.medium,
                    fontSize: 14,
                  ) */
                      context.textTheme.bodyText1,
                  decoration: InputDecoration(
                    counterText: '',
                    fillColor: widget.backgroundColor ?? Colors.transparent,
                    filled: true,
                    contentPadding: widget.prefixIcon != null
                        ? const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 8)
                        : EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: widget.horizontalContentPadding ?? 20),
                    hintText: widget.hintText ?? '',
                    errorStyle: const TextStyle(),
                    errorMaxLines: 3,
                    hintStyle: context.textTheme.subtitle2?.copyWith(
                        fontSize: 12,
                        color: context.isDarkMode
                            ? AppColors.hintColorDark
                            : AppColors.hintColor),
                    focusedBorder: isAppTextFieldStyleNormal
                        ? Styles.normalStyle(colors: widget.backgroundColor)
                        : Styles.roundedStyle(isFocused: true),
                    border: isAppTextFieldStyleNormal
                        ? Styles.normalStyle(colors: widget.backgroundColor)
                        : Styles.roundedStyle(),
                    enabledBorder: isAppTextFieldStyleNormal
                        ? Styles.normalStyle(colors: widget.backgroundColor)
                        : Styles.roundedStyle(),
                    hoverColor: Colors.transparent,
                    prefixIcon: widget.prefixIcon != null
                        ? Padding(
                            padding:
                                EdgeInsets.all(widget.prefixIconPadding ?? 12),
                            child: widget.prefixIcon,
                          )
                        : widget.isPrefixCountryCodePicker
                            ? CountryCodePicker(
                                onChanged: (value) {
                                  Get.log(
                                      "CountryCodePicker - onChanged - value = ${value.toString()}");
                                  selectedCountryCode = value;
                                  Get.log(
                                      "CountryCodePicker - onChanged - selectedCountryCode = ${selectedCountryCode.toString()}");
                                  widget.onCountryCodeChanged != null
                                      ? widget.onCountryCodeChanged!(value)
                                      : null;
                                },
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection:
                                    widget.initialCountryCode ?? '+971',
                                onInit: (value) => selectedCountryCode = value,
                                dialogBackgroundColor: Get.isDarkMode
                                    ? AppColors.scaffoldBackgroundDark
                                    : AppColors.scaffoldBackgroundLight,
                                showFlag: true,
                                showDropDownButton: true,
                                showFlagMain: true,
                                textStyle: /* TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: AppFontWeight.semiBold,
                                ) */
                                    context.textTheme.bodyText1,
                                searchStyle: /* const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ) */
                                    context.textTheme.bodyText1,
                                searchDecoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Get.isDarkMode
                                            ? AppColors.textFieldFocusBorderDark
                                            : AppColors.textFieldFocusBorder),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Get.isDarkMode
                                            ? AppColors
                                                .textFieldUnfocusBorderDark
                                            : AppColors.textFieldUnfocusBorder),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Get.isDarkMode
                                            ? AppColors
                                                .textFieldUnfocusBorderDark
                                            : AppColors.textFieldUnfocusBorder),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                  ),
                                ),
                                favorite: const ['+971', 'AE', '+49', 'DE'],
                              )
                            : null,
                    suffixIcon: widget.suffixIcon != null
                        ? GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              if (widget.obscureText) {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              }
                              widget.onSuffixIconTap?.call() ??
                                  Get.log(
                                      "App text filed - Suffix onTap is null");
                            },
                            child: Padding(
                              padding: EdgeInsets.all(
                                  widget.suffixIconPadding ?? 16),
                              child: obscureText
                                  ? widget.suffixIconObscured
                                  : widget.suffixIcon,
                            ),
                            /*child: Padding(
                              padding:
                                  EdgeInsets.all(widget.suffixIconPadding ?? 16),
                              child: widget.suffixIcon,
                            ),*/
                          )
                        : null,
                  ),
                  validator: (value) =>
                      widget.errorText ??
                      widget.validator!(value ?? "", selectedCountryCode),
                  onChanged: (value) => widget.onChanged != null
                      ? widget.onChanged!(value, selectedCountryCode)
                      : null,
                  onTap: widget.onTap,
                  controller: widget.controller,
                  showCursor: widget.showCursor,
                  cursorColor: context.isDarkMode
                      ? AppColors.subTittleColorDark
                      : AppColors.subTittleColor,
                  obscureText: obscureText,
                  obscuringCharacter: "•",
                  textCapitalization:
                      widget.textCapitalization ?? TextCapitalization.none,
                  textInputAction: widget.textInputAction,
                  autocorrect: false,
                  enableSuggestions: widget.enableSuggestions ?? true,
                  enableInteractiveSelection: widget.canUserType ?? true,
                  inputFormatters: inputFormatters,
                  onFieldSubmitted: (value) => widget.onSubmitted?.call(value),
                  maxLength: widget.maxLength,
                  focusNode: widget.focusNode,
                  enabled: widget.enabled,
                  readOnly: widget.readOnly ?? false,
                  onSaved: (newValue) => widget.onSaved != null
                      ? widget.onSaved!(newValue ?? "", selectedCountryCode)
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Styles {
  static OutlineInputBorder roundedStyle({bool isFocused = false}) =>
      OutlineInputBorder(
        borderSide: BorderSide(
            color: Get.isDarkMode
                ? isFocused
                    ? AppColors.textFieldFocusBorderDark
                    : AppColors.textFieldUnfocusBorderDark
                : isFocused
                    ? AppColors.textFieldFocusBorder
                    : AppColors.textFieldUnfocusBorder),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      );

  static UnderlineInputBorder normalStyle({Color? colors}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
          color: colors ??
              (Get.isDarkMode
                  ? AppColors.textFieldUnfocusBorderDark
                  : AppColors.textFieldUnfocusBorder),
          width: 2),
    );
  }
}
