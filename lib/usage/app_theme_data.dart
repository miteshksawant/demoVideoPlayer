import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/usage/app_colors.dart';
import 'package:video_player_demo/usage/app_fonts.dart';

class AppThemeData {
  static ThemeData darkTheme = ThemeData.dark();
  static ThemeData lightTheme = ThemeData.light();

  static void setThemeData() async {
    AppThemeData.darkTheme = ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
        brightness: Brightness.dark,
        //fontFamily: AppFonts.rubik,
        fontFamily: AppFonts.barlow,
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.scaffoldBackgroundDark,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.scaffoldBackgroundDark,
              statusBarIconBrightness:
                  Brightness.light, // For Android (light icons)
              statusBarBrightness: Brightness.dark, // For iOS (light icons)
            )),
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 96,
              //fontFamily: AppFonts.syncopate,
              fontFamily: AppFonts.barlow,
              fontWeight: AppFontWeight.light,
              color: AppColors.tittleColorDark),
          headline2: TextStyle(
              fontSize: 60,
              //fontFamily: AppFonts.syncopate,
              fontFamily: AppFonts.barlow,
              fontWeight: AppFontWeight.light,
              color: AppColors.tittleColorDark),
          headline3: TextStyle(
              fontSize: 48,
              //fontFamily: AppFonts.syncopate,
              fontFamily: AppFonts.barlow,
              fontWeight: AppFontWeight.regular,
              color: AppColors.tittleColorDark),
          headline4: TextStyle(
              fontSize: 34,
              //fontFamily: AppFonts.syncopate,
              fontFamily: AppFonts.barlow,
              fontWeight: AppFontWeight.regular,
              color: AppColors.tittleColorDark),
          headline5: TextStyle(
              fontSize: 24,
              //fontFamily: AppFonts.syncopate,
              fontFamily: AppFonts.barlow,
              fontWeight: AppFontWeight.bold,
              color: AppColors.tittleColorDark),
          headline6: TextStyle(
              fontSize: 20,
              fontFamily: AppFonts.barlow,
              //fontFamily: AppFonts.syncopate,
              fontWeight: AppFontWeight.bold,
              color: AppColors.tittleColorDark),
          subtitle1: TextStyle(
              fontSize: 16,
              fontWeight: AppFontWeight.regular,
              color: AppColors.subTittleColorDark),
          subtitle2: TextStyle(
              fontSize: 14,
              fontWeight: AppFontWeight.medium,
              color: AppColors.subTittleColorDark),
          bodyText2: TextStyle(
              fontSize: 16,
              fontWeight: AppFontWeight.regular,
              color: AppColors.tittleColorDark),
          bodyText1: TextStyle(
              fontSize: 14,
              fontWeight: AppFontWeight.regular,
              color: AppColors.tittleColorDark),
          button: TextStyle(
            fontSize: 14,
            color: AppColors.whiteColor,
            fontWeight: AppFontWeight.bold,
          ),
          caption: TextStyle(
              fontSize: 12,
              fontWeight: AppFontWeight.regular,
              color: AppColors.tittleColorDark),
          overline: TextStyle(
              fontSize: 10,
              fontWeight: AppFontWeight.regular,
              color: AppColors.tittleColorDark),
        ),
        iconTheme: IconThemeData(color: AppColors.tittleColorDark),
        checkboxTheme: CheckboxThemeData(
          checkColor:
              MaterialStateProperty.all(AppColors.scaffoldBackgroundDark),
          fillColor: MaterialStateProperty.all(AppColors.buttonColorDark),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(AppColors.buttonColorDark),
        ),
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: AppColors.themeColor),
        dividerTheme:
            DividerThemeData(color: AppColors.dividerDark, thickness: 1),
        shadowColor: AppColors.secondaryColor,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: GetPlatform.isWeb
              ? AppColors.backgroundShadow.withOpacity(.5)
              : Colors.transparent,
          cursorColor: GetPlatform.isWeb
              ? AppColors.backgroundShadow.withOpacity(.6)
              : Colors.transparent,
          selectionHandleColor: GetPlatform.isWeb
              ? AppColors.backgroundShadow.withOpacity(.6)
              : Colors.transparent,
        ),
        cardTheme: CardTheme(
          color: AppColors.scaffoldBackgroundDark,
          shadowColor: AppColors.grayColor,
          elevation: 5,
        ),
        drawerTheme: const DrawerThemeData(
          scrimColor: Colors.transparent,
        ),
        dialogTheme: const DialogTheme(elevation: 0.2));

    AppThemeData.lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
      brightness: Brightness.light,
      //fontFamily: AppFonts.rubik,
      fontFamily: AppFonts.barlow,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.scaffoldBackgroundLight,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.scaffoldBackgroundLight,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          )),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 96,
            //fontFamily: AppFonts.syncopate,
            fontFamily: AppFonts.barlow,
            fontWeight: AppFontWeight.light,
            color: AppColors.tittleColor),
        headline2: TextStyle(
            fontSize: 60,
            //fontFamily: AppFonts.syncopate,
            fontFamily: AppFonts.barlow,
            fontWeight: AppFontWeight.light,
            color: AppColors.tittleColor),
        headline3: TextStyle(
            fontSize: 48,
            //fontFamily: AppFonts.syncopate,
            fontFamily: AppFonts.barlow,
            fontWeight: AppFontWeight.regular,
            color: AppColors.tittleColor),
        headline4: TextStyle(
            fontSize: 34,
            //fontFamily: AppFonts.syncopate,
            fontFamily: AppFonts.barlow,
            fontWeight: AppFontWeight.regular,
            color: AppColors.tittleColor),
        headline5: TextStyle(
            fontSize: 24,
            //fontFamily: AppFonts.syncopate,
            fontFamily: AppFonts.barlow,
            fontWeight: AppFontWeight.bold,
            color: AppColors.tittleColor),
        headline6: TextStyle(
            fontSize: 20,
            //fontFamily: AppFonts.syncopate,
            fontFamily: AppFonts.barlow,
            fontWeight: AppFontWeight.bold,
            color: AppColors.tittleColor),
        subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: AppFontWeight.regular,
            color: AppColors.subTittleColor),
        subtitle2: TextStyle(
            fontSize: 14,
            fontWeight: AppFontWeight.medium,
            color: AppColors.subTittleColor),
        bodyText2: TextStyle(
            fontSize: 16,
            fontWeight: AppFontWeight.regular,
            color: AppColors.tittleColor),
        bodyText1: TextStyle(
            fontSize: 14,
            fontWeight: AppFontWeight.regular,
            color: AppColors.tittleColor),
        button: TextStyle(
            fontSize: 14,
            fontWeight: AppFontWeight.bold,
            color: AppColors.whiteColor),
        caption: TextStyle(
            fontSize: 12,
            fontWeight: AppFontWeight.regular,
            color: AppColors.tittleColor),
        overline: TextStyle(
            fontSize: 10,
            fontWeight: AppFontWeight.regular,
            color: AppColors.tittleColor),
      ),
      iconTheme: IconThemeData(color: AppColors.tittleColor),
      checkboxTheme: CheckboxThemeData(
        checkColor:
            MaterialStateProperty.all(AppColors.scaffoldBackgroundLight),
        fillColor: MaterialStateProperty.all(AppColors.buttonColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(AppColors.buttonColor),
      ),
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: AppColors.themeColor),
      dividerTheme:
          DividerThemeData(color: AppColors.dividerLight, thickness: 1),
      shadowColor: AppColors.secondaryColorDark,

      textSelectionTheme: TextSelectionThemeData(
        selectionColor: GetPlatform.isWeb
            ? AppColors.backgroundShadow.withOpacity(.5)
            : Colors.transparent,
        cursorColor: GetPlatform.isWeb
            ? AppColors.backgroundShadow.withOpacity(.6)
            : Colors.transparent,
        selectionHandleColor: GetPlatform.isWeb
            ? AppColors.backgroundShadow.withOpacity(.6)
            : Colors.transparent,
      ),
      cardTheme: CardTheme(
        color: AppColors.scaffoldBackgroundLight,
        shadowColor: AppColors.grayColor,
        elevation: 5,
      ),
      drawerTheme: const DrawerThemeData(
        scrimColor: Colors.transparent,
      ),
      dialogTheme: const DialogTheme(elevation: 0.2),
    );

    await Get.forceAppUpdate();
  }
}
