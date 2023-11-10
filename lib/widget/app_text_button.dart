import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/usage/app_colors.dart';
import 'package:video_player_demo/widget/app_text.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({Key? key, this.onTap, this.title, this.color, this.icon})
      : super(key: key);
  final Function()? onTap;
  final String? title;
  final Color? color;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? TextButton.icon(
            onPressed: () => onTap?.call(),
            icon: icon!,
            label: AppText(
              title ?? "",
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: context.textTheme.button?.copyWith(
                  color: color ??
                      (Get.isDarkMode
                          ? AppColors.buttonColorDark
                          : AppColors.buttonColor)),
            ))
        : TextButton(
            onPressed: () => onTap?.call(),
            child: AppText(
              title ?? "",
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: context.textTheme.button?.copyWith(
                  color: color ??
                      (Get.isDarkMode
                          ? AppColors.buttonColorDark
                          : AppColors.buttonColor)),
            ),
          );
  }
}
