import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppPrefs {
  static final GetStorage _getStorage = GetStorage();

  static const String _keyIsLoggedIn = "isLoggedIn";
  static const String _keyIntro = "introSeen";
  static const String _keyToken = "token";
  static const String _keyUserId = "userId";

  static const String _keyIsDarkMode = "isDarkMode";
  static const String _keyIsSystemDefaultMode = "isSystemDefaultMode";

  static const String _keyName = "name";
  static const String _keyUserName = "username";
  static const String _keyProfileImage = "profileImage";
  static const String _keyEmail = "email";
  static const String _keyPhoneNumber = "phoneNumber";
  static const String _keyCountryCode = "countryCode";
  static const String _keyGuestLogin = "guestLogin";
  static const String _keySearchSuggestions = "storeSuggestions";
  static const String _keyTextScale = "textScale";
  static const String _keyUILanguageCode = "uILanguageCode";
  static const String _keyCurrencyCode = "currencyCode";

  static bool get isIntroAlreadySeen =>
      _getStorage.read<bool>(_keyIntro) ?? false;

  static bool get isUserLoggedIn =>
      _getStorage.read<bool>(_keyIsLoggedIn) ?? false;

  static String get name => _getStorage.read(_keyName) ?? "";

  static String get userName => _getStorage.read(_keyUserName) ?? "";

  static String get email => _getStorage.read(_keyEmail) ?? "";

  static String get phoneNumber => _getStorage.read(_keyPhoneNumber) ?? "";

  static String get countryCode => _getStorage.read(_keyCountryCode) ?? "";

  static String? get token => _getStorage.read(_keyToken);

  static String? get userId => _getStorage.read(_keyUserId);

  static String? get currencyCode =>
      _getStorage.read(_keyCurrencyCode) ?? "USD";

  static String get uiLanguageCode =>
      _getStorage.read<String>(_keyUILanguageCode) ?? "ENG";

  static bool get isGuestLogin =>
      _getStorage.read<bool>(_keyGuestLogin) ?? false;

  static bool get isDarkMode => _getStorage.read<bool>(_keyIsDarkMode) ?? false;

  static bool get isSystemDefaultMode =>
      _getStorage.read<bool>(_keyIsSystemDefaultMode) ?? true;

  static List get searchSuggestions =>
      _getStorage.read<List>(_keySearchSuggestions) ?? [];

  static double get textScale => _getStorage.read<double>(_keyTextScale) ?? 10;

  static Future<void> setIsDarkMode(isDarkMode) async {
    return await _getStorage.write(_keyIsDarkMode, isDarkMode);
  }

  static Future<void> setIsSystemDefaultMode(isSystemDefaultMode) async {
    return await _getStorage.write(
        _keyIsSystemDefaultMode, isSystemDefaultMode);
  }

  static Future<void> setIntroSeen() async {
    return await _getStorage.write(_keyIntro, true);
  }

  static Future<void> setIsLoggedIn(bool loginStatus) async {
    return await _getStorage.write(_keyIsLoggedIn, loginStatus);
  }

  static Future<void> setToken(String? token) async {
    return await _getStorage.write(_keyToken, token);
  }

  static Future<void> setUserId(String? userId) async {
    return await _getStorage.write(_keyToken, userId);
  }

  static Future<void> setName(String? name) async {
    return await _getStorage.write(_keyName, name);
  }

  static Future<void> setUserName(String? userName) async {
    return await _getStorage.write(_keyUserName, userName);
  }

  static Future<void> setProfilePicture(String? profilePhotoUrl) async {
    return await _getStorage.write(_keyProfileImage, profilePhotoUrl);
  }

  static Future<void> setEmail(String? value) async {
    return await _getStorage.write(_keyEmail, value);
  }

  static Future<void> setPhoneNumber(String? value) async {
    return await _getStorage.write(_keyPhoneNumber, value);
  }

  static Future<void> setCountryCode(String? value) async {
    return await _getStorage.write(_keyCountryCode, value);
  }

  static Future<void> setUILanguageCode(String? value) async {
    return await _getStorage.write(_keyUILanguageCode, value);
  }

  static Future<void> setGuestLoginStatus(bool? value) async {
    Get.log("setGuestLoginStatus - value = $value");
    return await _getStorage.write(_keyGuestLogin, value);
  }

  static Future<void> setTextScale(double? value) async {
    return await _getStorage.write(_keyTextScale, value);
  }

  static Future<void> setSearchSuggetions(List? value) async {
    return await _getStorage.write(_keySearchSuggestions, value);
  }

  static Future<void> setCurrencyCode(String? value) async {
    return await _getStorage.write(_keyCurrencyCode, value);
  }

  static Future<void> onLogout() async {
    // await setName(null);
    // await setUserName(null);
    // await setProfilePicture(null);
    // await setToken(null);
    bool isDarkMode = AppPrefs.isDarkMode;
    bool isSystemDefaultTheme = AppPrefs.isSystemDefaultMode;
    bool isIntroSeen = AppPrefs.isIntroAlreadySeen;
    _getStorage.erase();
    AppPrefs.setIsDarkMode(isDarkMode);
    AppPrefs.setIsSystemDefaultMode(isSystemDefaultTheme);
    if (isIntroSeen) {
      AppPrefs.setIntroSeen();
    }
    return;
  }
}
