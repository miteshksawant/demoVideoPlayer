import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/usage/app_colors.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton(
      {Key? key, this.padding = 16, this.isDebuggingMode = false})
      : super(key: key);
  final double padding;
  final bool isDebuggingMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      /*child: IconButton(
        padding: EdgeInsets.zero,
        icon: Image.asset(
          AppAssets.iconBack,
          color: Colors.white,
          height: 15,
          width: 15,
        ),
        tooltip: "Back",
        onPressed: () {
          Get.back(canPop: true);
        },
        splashRadius: 25,
      ),*/
      child: (Navigator.of(context).canPop() || isDebuggingMode)
          ? Padding(
              padding: const EdgeInsets.only(left: 16),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: /* Image.asset(
                AppAssets.icBack,
                color: Colors.white,
                height: 15,
                width: 15,
              ) */
                    Icon(
                  Icons.arrow_back_ios,
                  color: context.isDarkMode
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                ),
                tooltip: "Back",
                onPressed: () {
                  Get.back(canPop: true);
                },
                splashRadius: 25,
              ),
            )
          : null,
    );
  }
}
