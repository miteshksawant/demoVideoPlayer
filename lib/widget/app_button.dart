import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/usage/app_colors.dart';
import 'package:video_player_demo/widget/app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton.outline({
    Key? key,
    this.text,
    this.onPressed,
    this.textColor,
    this.backgroundColor,
    this.elevation,
    this.fontSize,
    this.borderColor,
    /*this.width,*/
    this.isFullScreenWidth = true,
    this.isFAB = false,
    this.isDisabled = false,
    this.verticalMargin = 5,
    this.horizontalMargin = 0,
    this.horizontalPadding = 0,
    this.isMini = false,
  })  : assert(
          text != null,
          'A non-null `text` must be provided to a  AppButton.outline widget.',
        ),
        prefixIcon = null,
        child = null,
        super(key: key);

  const AppButton.widget({
    Key? key,
    this.child,
    this.prefixIcon,
    this.onPressed,
    this.textColor,
    this.backgroundColor,
    this.elevation,
    this.fontSize,
    this.borderColor,
    /*this.width,*/
    this.isFullScreenWidth = true,
    this.isFAB = false,
    this.isDisabled = false,
    this.verticalMargin = 5,
    this.horizontalMargin = 0,
    this.horizontalPadding = 0,
    this.isMini = false,
  })  : assert(
          child != null,
          'A non-null `child` must be provided to a  AppButton.widget widget.',
        ),
        text = null,
        super(key: key);

  final String? text;

  // final double? width;
  final Widget? prefixIcon;
  final Widget? child;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? elevation;
  final double? fontSize;
  final VoidCallback? onPressed;
  final bool isFullScreenWidth;
  final bool isFAB;
  final bool? isDisabled;
  final double verticalMargin;
  final double horizontalMargin;
  final double horizontalPadding;
  final bool isMini;

  @override
  Widget build(BuildContext context) {
    if (text != null) {
      /// Outlined Button
      return Container(
        margin: isFAB
            ? EdgeInsets.only(
                top: verticalMargin / 2,
                bottom: verticalMargin / 2,
                left: 32,
                right: horizontalMargin / 2,
              )
            : EdgeInsets.symmetric(
                vertical: verticalMargin, horizontal: horizontalMargin),
        width: isFullScreenWidth
            ? double.infinity
            : isMini
                ? 75
                : 250,
        height: isMini ? 30 : 50,
        child: ElevatedButton(
          onPressed: !isDisabled! ? onPressed : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              !isDisabled!
                  ? backgroundColor ?? Colors.transparent
                  : AppColors.grayColor,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: !isDisabled!
                      ? borderColor ??
                          (Get.isDarkMode
                              ? AppColors.buttonColorDark
                              : AppColors.buttonColor)
                      : AppColors.grayColor,
                  width: 1,
                ),
              ),
            ),
            elevation: MaterialStateProperty.all<double>(elevation ?? 0.0),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding == 0 ? 8 : horizontalPadding),
            child: AppText(
              text ?? "Button Text",
              style: context.textTheme.button?.copyWith(
                color: !isDisabled!
                    ? textColor ??
                        (Get.isDarkMode
                            ? AppColors.buttonColorDark
                            : AppColors.buttonColor)
                    : AppColors.whiteColor,
              ),
            ),
          ),
        ),
      );
    }
    if (child != null) {
      /// Widget Button
      return Container(
        margin: isFAB
            ? EdgeInsets.only(
                top: verticalMargin / 2,
                bottom: verticalMargin / 2,
                left: 32,
                right: horizontalMargin / 2,
              )
            : EdgeInsets.symmetric(
                vertical: verticalMargin, horizontal: horizontalMargin),
        width: isFullScreenWidth
            ? double.infinity
            : isMini
                ? 75
                : 150,
        height: isMini ? 30 : 50,
        child: ElevatedButton.icon(
          onPressed: !isDisabled! ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: !isDisabled!
                ? backgroundColor ??
                    (Get.isDarkMode
                        ? AppColors.buttonColorDark
                        : AppColors.buttonColor)
                : AppColors.grayColor,
            disabledBackgroundColor: !isDisabled!
                ? backgroundColor ??
                    (Get.isDarkMode
                        ? AppColors.buttonColorDark
                        : AppColors.buttonColor)
                : AppColors.grayColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                  color: !isDisabled!
                      ? borderColor ?? Colors.transparent
                      : AppColors.grayColor,
                  width: 0.7),
            ),
            elevation: elevation ?? 0,
            textStyle: context.textTheme.button,
          ),
          /*style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor ?? AppColors.buttonColorRed),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                    color: borderColor ?? AppColors.buttonColorRed, width: 0.7),
              ),
            ),
            elevation: MaterialStateProperty.all<double>(elevation ?? 0.0),
            textStyle: TextStyle()
          ),*/
          icon: prefixIcon != null ? prefixIcon! : Container(),
          label: child!,
        ),
      );
    }
    return Container();
  }
}
