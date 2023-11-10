// import 'package:boutique/screens/login_screen/login_screen.dart';
// import 'package:boutique/usage/startup/network_controller.dart';
// import 'package:boutique/widgets/app_widgets_exports.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player_demo/screens/login_screen/login_screen.dart';
import 'package:video_player_demo/usage/app_colors.dart';

// import 'app_usage_exports.dart';
import 'package:async/async.dart';
import 'package:video_player_demo/usage/app_const.dart';
import 'package:video_player_demo/usage/app_fonts.dart';
import 'package:video_player_demo/usage/app_form_validators.dart';
import 'package:video_player_demo/usage/app_prefs.dart';
import 'package:video_player_demo/usage/app_strings.dart';
import 'package:video_player_demo/widget/app_button.dart';
import 'package:video_player_demo/widget/app_cached_network_image.dart';
import 'package:video_player_demo/widget/app_text.dart';

bool notNull<T>(T? obj) => obj != null;

bool isNull<T>(T? obj) => obj == null;

Widget container() => Container();

class AppCommon {
  // static get generalPadding => isWeb ? Get.width * 0.15 : Get.width * 0.05;
  AppCommon._();

  static double get generalPadding => 16;

  static double get bottomBigFabGeneralPadding => 70;

  static bool get isWeb => Get.width > webWidth;

  static double webWidth = 1200;

  static String userRole = "";

  static final Map<dynamic, String> _tagTitles = {
    // EnumTags.notVerified: AppStrings.notVerified,
  };

  static String getTagTitle(dynamic enumTag) {
    return _tagTitles[enumTag] ?? "Null here";
  }

  static double generalPaddingWithConstraints(BoxConstraints constraints) {
    if (isWeb) {
      return (constraints.maxWidth - webWidth) / 2;
      return (Get.width - webWidth) / 2;
    }
    return constraints.maxWidth * 0.05;
    return isWeb ? constraints.maxWidth * 0.15 : constraints.maxWidth * 0.05;
    return isWeb ? Get.width * 0.71 : Get.width * 0.95;
  }

  static showAlertDialog({required String message}) {
    Get.defaultDialog(
      title: AppStrings.alert,
      content: Text(message),
      textConfirm: AppStrings.ok,
      confirmTextColor: AppColors.blackColor,
      onConfirm: () {
        Get.back();
      },
    );
  }

  static showLoadingDialog() async {
    await Get.dialog(
      WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: const Center(child: CircularProgressIndicator()),
      ),
      barrierDismissible: false,
    );
  }

  static hideDialog() {
    Get.until((route) => !Get.isDialogOpen!);
    /*if(Get.isDialogOpen){
      Get.back(canPop: false);
    }*/
  }

  /*static apiCallHandler(Function() apiCallBody) async {
    showLoadingDiaGet.log();
    try {
      await apiCallBody();
    } catch (e) {
      Fluttertoast.showToast(msg: e);
    } finally {
      hideLoadingDiaGet.log();
    }
  }*/

  static Future<bool> apiCallHandler<T>(Function() apiCallBody,
      {Function(T? data)? onApiCallSuccess,
      Function(String errorMessage)? onApiCallFail}) async {
    Get.log("apiCallHandler called");
    bool res = false;
    String errorMessage = "";
    T? model;
    showLoadingDialog();
    try {
      model = await apiCallBody();
      res = true;
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString());
      // print("apiCallHandler error - $e");
      Get.log("apiCallHandler error - $e", isError: true);
      e.printError();
      errorMessage = e.toString();
      // Get.log("apiCallHandler error - $e");
      // hideDialog();
      res = false;
    } finally {
      /* try {
        NetworkController controller = Get.find<NetworkController>();
        bool isOnline = await controller.checkIsDeviceOnline();
        if (isOnline) {
          hideDialog();
        }
      } catch (e) {
        Get.log("Exception : Api utill network controller not found..");
        hideDialog();
      } */
      hideDialog();
      // return res;
    }
    res
        ? onApiCallSuccess != null
            ? onApiCallSuccess(model)
            : ""
        : onApiCallFail != null
            ? onApiCallFail(errorMessage)
            : "";
    return res;
  }

  static apiCallHandlerWithGetXStateMixin<T, G>(
      StateMixin<G> controller, Function() apiCallBody,
      {Function(T? data)? onApiCallSuccess, Function()? onApiCallFail}) async {
    Get.log("apiCallHandler called");
    bool res = false;
    T? model;
    // showLoadingDialog();
    controller.change(null, status: RxStatus.loading());
    try {
      model = await apiCallBody();
      res = true;
      // controller.change(model, status: RxStatus.success());
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString());
      Get.log("apiCallHandler error - $e");
      res = false;
      controller.change(null, status: RxStatus.error());
    } finally {
      // hideDialog();
      // return res;
    }
    res
        ? onApiCallSuccess != null
            ? onApiCallSuccess(model)
            : ""
        : onApiCallFail != null
            ? onApiCallFail()
            : "";
  }

  // TODO: Modify method as per the `apiCallHandler`'s `onApiCallSuccess` & `onApiCallFail` methods
  static formButtonClick<T>(
      GlobalKey<FormState> _formKey, Function() onClickAction,
      {Function(T? data)? onApiCallSuccess,
      Function(String errorMessage)? onApiCallFail}) {
    AppFormValidators.validateAndSave(_formKey, () async {
      return await AppCommon.apiCallHandler<T>(
        () async {
          return await onClickAction();
        },
        onApiCallSuccess: (data) => onApiCallSuccess?.call(data),
        onApiCallFail: (errorMessage) => onApiCallFail?.call(errorMessage),
      );
    });
  }

  static formButtonClickWithMultipleForms(
      List<GlobalKey<FormState>> _formKeys, Function() onClickAction) {
    AppFormValidators.validateMultipleFormAndSave(_formKeys, () {
      AppCommon.apiCallHandler(() async {
        return await onClickAction();
      });
    });
  }

  static double get screenHeight =>
      Get.height - Get.statusBarHeight - Get.bottomBarHeight;

  /* static textFieldKeyboardSetup() {
    print("textFieldKeyboardSetup called");
    var keyboardVisibilityController = KeyboardVisibilityController();

    // Subscribe
    keyboardVisibilityController.onChange.listen((bool visible) {
      print('Keyboard visibility update. Is visible: ${visible}');
      print("textFieldKeyboardSetup onHide");
      if (!visible) {
        Get.focusScope!.unfocus();
      }
    });
  } */

  /*static void handleApiError(DioError? dioError, {bool showToast = true, bool allowForceLogout = true}) {
    if (showToast) {
      if (DioErrorType.other == dioError?.type) {
        if (dioError?.message.contains('SocketException') ?? false) {
          AppCommon.showToast(msg: "Please verify your internet connection and try again");
        } else {
          AppCommon.showToast(msg: dioError?.response?.data.toString() ?? AppStrings.somethingWentWrong);
        }
      } else {
        AppCommon.showToast(msg: dioError?.response?.data.toString() ?? AppStrings.somethingWentWrong);
      }
    }
    switch (dioError?.response?.statusCode) {
      case 401:
        SocialController.logout();
        break;
      case 302:
        SocialController.logout();
        break;
    }
  }*/

  static String enumToString(dynamic enumData) {
    return enumData.toString().split(".").last;
  }

  static T stringToEnum<T>(List<T> enums, String enumData) {
    String data = enumData.toString().split(".").last;
    T? result;
    for (var value in enums) {
      if (value.toString().split(".").last == data) {
        result = value;
      }
    }
    if (isNull(result)) {
      result = enums.first;
    }
    return result!;
    // return enumData.toString().split(".").last as T;
  }

  static String formatNumberWithCommas(num number) {
    var formatter = NumberFormat('######.##');
    return formatter.format(number);
  }

  static String compactNumber(num number) {
    return NumberFormat.compact().format(number);
  }

  static String getFormattedDate({required DateTime dateTime}) {
    final DateFormat _formatter = DateFormat('yyyy-MM-dd');
    return _formatter.format(dateTime);
  }

  static String getFormattedDateForBookingRequests({required int epoch}) {
    final DateFormat _formatter = DateFormat('dd MMMM, yyyy');
    return _formatter
        .format(DateTime.fromMillisecondsSinceEpoch(epoch, isUtc: true));
  }

  static String formatDateFromEpoch({required DateTime dateTime}) {
    if (dateTime != null) {
      final DateFormat _formatter = DateFormat('dd MMMM, yyyy');
      return _formatter.format(dateTime);
    } else {
      return "";
    }
  }

  static String getFormattedDateAndTime({required DateTime dateTime}) {
    final DateFormat _formatter = DateFormat('yyyy-MM-dd HH:mm:s');
    return _formatter.format(dateTime);
  }

  static String getFormattedTime({required DateTime dateTime}) {
    final DateFormat _formatter = DateFormat('HH:mm a');
    return _formatter.format(dateTime);
  }

  static String getFormattedTimeWithoutMeridiem({required DateTime dateTime}) {
    final DateFormat _formatter = DateFormat('hh:mm a');
    return _formatter.format(dateTime);
  }

  static String getFormattedDateAndTimeForAssetListing(
      {required DateTime dateTime}) {
    final DateFormat _formatter = DateFormat('dd MMMM, yyyy hh:mm a');
    return _formatter.format(dateTime);
  }

  static String getFormattedDateAndTimeForAssetDetails(
      {required DateTime dateTime}) {
    final DateFormat _formatter = DateFormat('dd MMMM, yyyy | hh:mm a');
    return _formatter.format(dateTime);
  }

  static DateTime convertDateTimeToLocalExternally(DateTime utcDateTime) {
    DateTime localDateTime = DateTime(
      utcDateTime.year,
      utcDateTime.month,
      utcDateTime.toLocal().day,
      utcDateTime.toLocal().hour,
      utcDateTime.toLocal().minute,
      utcDateTime.toLocal().second,
      utcDateTime.toLocal().millisecond,
      utcDateTime.toLocal().microsecond,
    );
    return localDateTime;
  }

  static int daysBetween(DateTime fromDate, DateTime toDate) {
    Get.log("---------------------------------------------------");
    Get.log("daysBetween - formDate - before = $fromDate");
    Get.log("daysBetween - toDate - before = $toDate");
    fromDate = DateTime(
        fromDate.year,
        fromDate.month,
        fromDate.day,
        fromDate.hour,
        fromDate.minute,
        fromDate.second,
        fromDate.millisecond,
        fromDate.microsecond);
    toDate = DateTime(toDate.year, toDate.month, toDate.day, toDate.hour,
        toDate.minute, toDate.second, toDate.millisecond, toDate.microsecond);
    Get.log("daysBetween - formDate - after = $fromDate");
    Get.log("daysBetween - toDate - after = $toDate");
    Get.log("---------------------------------------------------");
    Get.log(
        "daysBetween - diff = ${(toDate.difference(fromDate).inHours / 24)}");
    Get.log(
        "daysBetween - diff - round = ${(toDate.difference(fromDate).inHours / 24).round()}");
    Get.log("---------------------------------------------------");
    return (toDate.difference(fromDate).inHours / 24).round();
  }

  static int hoursBetween(DateTime fromDate, DateTime toDate) {
    return toDate.difference(fromDate).inHours;
  }

  /*static int getBookingDays() {
    LocationDateTimeController _locationDateTimeController =
        Get.find<LocationDateTimeController>();
    return (_locationDateTimeController.toDate.value
                .difference(_locationDateTimeController.fromDate.value)
                .inHours /
            24)
        .ceil();
  }*/

  static cachedNetworkProvider(
      {required String url, int? maxHeight, int? maxWidth}) {
    return CachedNetworkImageProvider(
      url,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }

  static checkLoginAndPerformAction({required Function() action}) {
    if (/* AppPrefs.token != null && AppPrefs.isUserLoggedIn */ !(AppPrefs
        .isGuestLogin)) {
      action.call();
    } else {
      // TODO: Setup - Login Screen
      AppCommon.hideDialog();
      Get.to(() => const LoginScreen());
    }
  }

  static turnOnLocation({required Function() action}) async {
    /*Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    // LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // _locationData = await location.getLocation();
    action.call();*/
  }

  /* static showOfflineDialog() async {
    await Get.dialog(WillPopScope(
        child: const AppCustomDialog(
            title: AppStrings.offline,
            subtitle: AppStrings.networkConnectionLost),
        onWillPop: () async {
          return false;
        }));
  } */

  /* static showAppMaintenanceDialog(
      {required String title,
      required String subtitle,
      required String btnTitle,
      required Function() btnClick}) async {
    await Get.dialog(WillPopScope(
        child: AppCustomDialog(
          title: title,
          subtitle: subtitle,
          actionBtnTitle: btnTitle,
          actionOnClick: () => btnClick.call(),
        ),
        onWillPop: () async {
          return false;
        }));
  } */

  /* static showUpdateDialog(
      {required bool isCancelBtnShow,
      Function? onCancel,
      required Function onOk}) {
    Get.dialog(
        WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: isCancelBtnShow
              ? AppCustomDialog(
                  title: AppStrings.appUpdateAvailable,
                  subtitle: AppStrings.pleaseUpdateAppToContinue,
                  actionBtnTitle: AppStrings.update,
                  secondaryBtnTitle: AppStrings.cancel,
                  secondaryOnClick: () => onCancel?.call(),
                  actionOnClick: () => onOk.call())
              : AppCustomDialog(
                  title: AppStrings.appUpdateAvailable,
                  subtitle: AppStrings.pleaseUpdateAppToContinue,
                  actionBtnTitle: AppStrings.update,
                  actionOnClick: () => onOk.call()),
        ),
        barrierDismissible: false);
  } */

  static showInformationDialog(
      {required String title,
      required String message,
      required String okButtonText,
      required Function onOk,
      String? cancelButtonText,
      Function? onCancel,
      bool? isCloseIcons,
      Widget? childWidget}) async {
    await Get.defaultDialog(
      backgroundColor: Get.isDarkMode
          ? AppColors.scaffoldBackgroundDark
          : AppColors.scaffoldBackgroundLight,
      onWillPop: () async => false,
      radius: 4,
      title: title,
      titleStyle:
          Get.textTheme.headline6?.copyWith(fontWeight: AppFontWeight.bold),
      titlePadding: const EdgeInsets.only(top: 16),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* if (isCloseIcons ?? false) ...[
            Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => Get.back(),
                      child: const AppImageWidget(asset: AppAssets.icClose)),
                ))
          ], */
          /* AppText(
            title,
            style: Get.textTheme.headline6
                ?.copyWith(fontWeight: AppFontWeight.bold),
          ),
          gap12, */
          Padding(
            padding: paddingH16,
            child: AppText(
              message,
              overflow: TextOverflow.visible,
              style: Get.textTheme.subtitle1,
            ),
          ),
          gap12,
          if (childWidget != null) ...[
            childWidget,
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: AppButton.widget(
                    isFullScreenWidth: false,
                    child: AppText(okButtonText,
                        style: Get.textTheme.button
                            ?.copyWith(color: AppColors.whiteColor)),
                    onPressed: () => onOk.call()),
              ),
              if (cancelButtonText != null) ...[
                gap8,
                Expanded(
                  child: AppButton.outline(
                    text: cancelButtonText,
                    isFullScreenWidth: false,
                    onPressed: () => onCancel?.call(),
                  ),
                )
              ]
            ],
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  static void makeCall(String phoneNumber) {
    launchUrl(Uri.parse("tel:$phoneNumber"));
  }

  static void makeEmail(String email) {
    launchUrl(Uri.parse("mailto:$email"));
  }

  static String? getYoutubeVideoIdByURL(String url) {
    /* final regex = RegExp(r'.*\?v=(.+?)&.+', caseSensitive: false);
    if (regex.hasMatch(url)) {
      return regex.firstMatch(url)!.group(1);
    } else {
      return null;
    } */

    for (var exp in [
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
    ]) {
      RegExpMatch? match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1);
    }

    return null;
  }

  static copyLink(String link) {
    Clipboard.setData(ClipboardData(text: link));
    showToast(msg: AppStrings.linkCopied);
  }

  static showToast({required String msg, bool isError = false}) {
    /* Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: timeInSecForIosWeb,
    ); */

    ToastFuture? toastFuture;

    Widget toastWidget = Container(
      margin: paddingH16,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          color: Get.isDarkMode
              ? AppColors.scaffoldBackgroundDark
              : AppColors.scaffoldBackgroundLight,
          boxShadow: [
            BoxShadow(
                blurRadius: 5, color: AppColors.grayColor.withOpacity(0.8))
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(isError ? Icons.close : Icons.check_circle_outlined,
              color: isError ? Colors.redAccent : Colors.greenAccent),
          gap12,
          Expanded(
            child: AppText(
              msg,
              overflow: TextOverflow.visible,
              style: Get.textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );

    toastFuture = showToastWidget(toastWidget,
        handleTouch: true,
        dismissOtherToast: false,
        position: ToastPosition.bottom,
        duration: const Duration(seconds: 2));
  }

  static String replaceSpecialCharacterFromString(
      String value, String replaceWith) {
    String str = value;
    String result = str.replaceAll(RegExp('[^A-Za-z0-9]'), replaceWith);
    return result;
  }

  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static CancelableOperation? cancellableOperation;

  static Future<dynamic> fromCancelable(Future<dynamic> future) async {
    cancellableOperation?.cancel();
    cancellableOperation = CancelableOperation.fromFuture(
      future,
      onCancel: () {
        print('Operation Cancelled');
      },
    );
    return cancellableOperation?.value;
  }

  static Future<T> getValueAfterDelay<T>(T value, {int delay = 500}) async {
    return Future.delayed(Duration(milliseconds: delay), () {
      Get.log("Process Started");
      return value;
    });
  }
}
