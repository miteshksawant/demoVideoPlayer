enum EnumGroupedButtonsOrientation {
  HORIZONTAL,
  VERTICAL,
}

enum EnumForgotPassOrEditName {
  ForgotPassword,
  EditName,
}

enum EnumChangePasswordValidator {
  MustIncludeALetter,
  MustIncludeNumbers,
  MustIncludeSpecialCharacter,
  MustBe8_30Characters,
  MustNotHaveSpace
}

enum EnumFilterSelectedIndicator {
  TypeCategorySelected,
  TagsCategorySelected,
  SourceCategorySelected,
  TimeCategorySelected,
  ListCategorySelected,
}

enum EnumUsernameOrEditUsername {
  Username,
  EditUsername,
}

enum EnumChangePasswordScreenOrResetPasswordScreen {
  ChangePasswordScreen,
  ResetPasswordScreen,
}

enum EnumUpdateProfileType {
  updateEmail,
  updateMobileNumber,
  updatePassword,
  updateGender,
  changeCity,
}

enum EnumTags {
  notVerified,
  pendingVerification,
  verified,
  UPCOMING_BOOKING,
  COMPLETED_BOOKING,
  CANCELED_BOOKING,
  ONGOING_BOOKING,
  PENDING_BOOKING,
}

enum EnumBookingCompletedSettledStatus {
  notSettled,
  settled,
}

enum EnumLoginType {
  EMAIL, // 0
  GOOGLE, // 1
  FACEBOOK, // 2
  APPLE, // 3
  PHONE_NUMBER, // 4
}

enum EnumDocumentStatus {
  VERIFICATION_PENDING,
  VERIFIED,
  REJECTED,
  NOT_VERIFIED,

  /// <- Keep this enum as last
}

enum EnumBookingDetails {
  newBooking,
  confirmed,
  inProgress,
  completed,
  rescheduled,
  cancelled,
  rejected,
  upcomingDelivery,
  upcomingPickup,
}

/*enum EnumBookingRequestStatus{
  confirmed,
  rejected,
}*/

enum EnumDocumentVerificationStatus {
  verify,
  reject,
  pendingVerification,
  partiallyVerified,
}

enum EnumPickupDeliveryStatus {
  kmDrivenPickup,
  kmDrivenDelivery,
  fuelIndicatorPickup,
  fuelIndicatorDelivery,
  carConditionPickup,
  carConditionDelivery,
}

enum EnumNotificationType {
  documentVerification,
  newBooking,
  carForDeliveryOrPickup,
  bookingStatus,
}

enum EnumTreeFileTypes {
  none,
  loading,
  EPUB, // Web
  HTML,
  ON,
  JPG,
  MP3,
  MP4,
  TEXT,
  AZW3, // Download Android, iOS, Web
  DJVU, // Download Android, iOS, Web
  M4A, // Download Android
  M4B, // Download Android
  MOBI, // Download Android, Web
  WORD, // Download Android, iOS, Web
  KFX, // Download Android, iOS, Web
  PDF, // Web
  ZIP, // Download Android, iOS, Web
  YOUTUBE,
  VIDEO,
}

enum EnumTabScreenTabs { HOME, CATEGORIES, BAG, ACCOUNT }

enum EnumNetworkStatus { Online, Offline }

enum EnumAddressType { HOME, OFFICE }

enum EnumProductGraphicType { IMAGE, VIDEO }

enum EnumOrderTrackStatus { PENDING, CONFIRMED, SHIPED, DELIVERED }

enum EnumOrderAction { CANCEL, RETURN, EXCHANGE }

enum EnumThemeMode { SYSTEM, LIGHT, DARK }

enum EnumSortBy { Recommended, New_In, Price_Low_To_High, Price_High_To_Low }

enum EnumCurrencyMode { USD, EUR }

enum EnumOrderStatus { COMPLETED, PENDING }
