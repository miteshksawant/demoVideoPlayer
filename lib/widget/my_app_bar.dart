import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/usage/app_colors.dart';
import 'package:video_player_demo/usage/app_common.dart';
import 'package:video_player_demo/usage/app_const.dart';
import 'package:video_player_demo/usage/app_fonts.dart';
import 'package:video_player_demo/widget/app_text.dart';
import 'app_bar_action_button.dart';
import 'app_bar_back_button.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    this.title,
    this.titleWidget,
    this.bottomWidget,
    this.bottomWidgetHeight,
    this.bottomWidgetPadding,
    this.leading,
    this.isLeadingVisible = true,
    this.isActionVisible = true,
    this.isLeadingMenu = false,
    this.isPhoneAppBarVisible = true,
    this.isWebAppBarVisible = true,
    this.centerTitle,
    this.backgroundColor,
    this.titleFontWeight = FontWeight.w500,
    this.actions,
  })  : assert(title == null || titleWidget == null,
            'Cannot provide both a title and a titleWidget'),
        super(key: key);

  final String? title;
  final Widget? titleWidget;
  final Widget? bottomWidget;
  final double? bottomWidgetHeight;
  final double? bottomWidgetPadding;
  final Widget? leading;
  final bool isLeadingVisible;
  final bool isActionVisible;
  final bool isLeadingMenu;
  final bool? centerTitle;
  final bool? isPhoneAppBarVisible;
  final bool? isWebAppBarVisible;
  final Color? backgroundColor;
  final FontWeight? titleFontWeight;
  final List<Widget>? actions;

  // ProfileScreenController _profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: Navigator.of(context).canPop() ? 32 : 0,
      leading: leading ??
          (isLeadingVisible
              ? isLeadingMenu
                  ? IconButton(
                      padding: padding16,
                      icon: Image.asset(
                        "AppAssets.menu",
                        color: AppColors.whiteColor,
                      ),
                      tooltip: "Menu",
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      splashRadius: 25,
                    )
                  : const AppBarBackButton()
              : null),
      title: title != null
          ? AppText(
              title ?? "",
              style: context.textTheme.headline6
                  ?.copyWith(fontWeight: AppFontWeight.semiBold),
            )
          : titleWidget ?? AppText("")
              /* Image.asset(
                AppAssets.icAppbarLogo,
                fit: BoxFit.contain,
              ), */

      /* Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      AppAssets.icAppbarLogo,
                      height: 20,
                    ),
                     Opacity(
                      opacity: 0.59,
                      child: Text(
                        AppStrings.tempText,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: AppFontWeight.thin,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ), 
                  ],
                ),
              ), */,
      titleSpacing: centerTitle == null || centerTitle == false ? null : 0.0,
      centerTitle: centerTitle ?? false,
      backgroundColor: backgroundColor,
      // actions: actions,
      actions: isActionVisible
          ? actions ??
              [
                /*Obx(
                  () => AppBarActionButton(
                    asset: AppAssets.iconNotification,
                    isNetworkImage: false,
                    padding: 8,
                    onPressed: () => Get.to(() => const NotificationScreen()),
                  ),
                )*/
                // TODO: Revise
                /*AppBarActionButton(
                  asset: AppAssets.iconNotification,
                  isNetworkImage: false,
                  padding: 8,
                  onPressed: () => Get.to(
                    () => const NotificationScreen(),
                  ),
                ),*/
              ]
          : [],
      bottom: bottomWidget != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(bottomWidgetHeight ?? 0),
              child: Padding(
                padding: bottomWidgetPadding != null
                    ? EdgeInsets.only(
                        left: bottomWidgetPadding!,
                        right: bottomWidgetPadding!,
                        bottom: 4.0)
                    : EdgeInsets.only(
                        left: AppCommon.generalPadding,
                        bottom: AppCommon.generalPadding,
                        right: AppCommon.generalPadding),
                child: bottomWidget != null
                    ? Container(
                        height: Get.height * 0.05,
                        width: Get.width,
                        color: AppColors.searchBackground,
                        child: bottomWidget,
                      )
                    : Container(),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(_getAppBarHeight() + (bottomWidgetHeight ?? 0));

  double _getAppBarHeight() {
    if (AppCommon.isWeb) {
      if (isWebAppBarVisible!) {
        return 120;
      } else {
        return 0;
      }
    } else {
      if (isPhoneAppBarVisible!) {
        return kToolbarHeight;
      } else {
        return 0;
      }
    }
    return AppCommon.isWeb ? 120 : kToolbarHeight;
  }
}
