import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:oktoast/oktoast.dart';
import 'package:video_player_demo/screens/home_screen/home_screen.dart';
import 'package:video_player_demo/screens/login_screen/login_screen.dart';
import 'package:video_player_demo/usage/app_prefs.dart';
import 'package:video_player_demo/usage/app_strings.dart';
import 'package:video_player_demo/usage/app_theme_data.dart';
import 'package:video_player_demo/usage/app_initial_bindings.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

late Logger logger;

Future<void> main() async {
  Get.isLogEnable = false;
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();

  logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2,
        // number of method calls to be displayed
        errorMethodCount: 8,
        // number of method calls if stacktrace is provided
        lineLength: 80,
        // width of the output
        stackTraceBeginIndex: 1,
        colors: true,
        // Colorful log messages
        printEmojis: true,
        // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return OKToast(
      child: GetMaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        enableLog: !kReleaseMode,
        themeMode: AppPrefs.isSystemDefaultMode
            ? ThemeMode.system
            : AppPrefs.isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
        theme: AppThemeData.lightTheme,
        darkTheme: AppThemeData.darkTheme,
        initialBinding: AppInitialBinding(),
        home:
            const LoginScreen() /* AppPrefs.isUserLoggedIn ? const LoginScreen() : const HomeScreen() */,
      ),
    );
  }
}
