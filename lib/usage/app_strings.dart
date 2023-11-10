import 'package:video_player_demo/usage/app_prefs.dart';
import 'package:get/get.dart';

class AppStrings {
  AppStrings._();

  static const String testUserId = "459954";
  static const String tempText = "Temporary text";

  static const String googlePlayStoreUrl = "";
  static const String appleStoreUrl = "";
  static const String boutiqueWebLink =
      "https://boutique.techniversesolutions.in/";

  static String appName = "Video Player Demo";


  static String underDevelopment =
      "This functionality is under development please use Log In as a guest functionality.";

  static String guestUser = "Guest";
  static String guestEmail = "guest@guest.com";

  static String userLogoutMessage = "You are logged out";

  static String appVersion(String version) {
    return "Version : $version";
  }

  //TODO: Common
  static const String mustIncludeALetter = "Must include an Uppercase letter";
  static const String mustIncludeNumbers = "Must include a number";
  static const String mustIncludeASpecialCharacter =
      "Must include a special character (!@#\$&*~)";
  static const String mustBe830Characters = "Must be 8-30 characters";
  static const String mustNotIncludeSpaces = "Must NOT include any spaces";
  static const String noTranslationAvailableText =
      "No translation available text";
  static const String somethingWentWrong = "Something went wrong";
  static const String enterValidMobileNumber = 'Enter a valid mobile number';

  static const String inactiveTitle = "Inactive";
  static const String inactiveSubtitle =
      "System find some activities that not meet with our policies, you can try to contact admin by clicking below.";
  static const String visitWebSite = "VISIT WEBSITE";
  static const String maintenanceTitle = "Maintenance";
  static const String maintenanceSubtitle =
      "Currently application is under maintenance, you can proceed further by clicking below.";

  static const String linkCopied = "Link Copied";
  static const String alert = "Alert";
  static const String ok = "Ok";
  static const String login = "Log in";
  static const String search = "Search";
  static const String register = "Register";
  static const String email = "Email*";
  static const String accountAlreadyExists = "Account already exists";
  static const String passwordTooWeak = "Password is too weak";
  static const String noUserFound = "User not found";
  static const String wrongPassword = "Wrong password";
  static const String wrongOtp = "Wrong OTP";
  static const String updateAvailable = "Update available";
  static const String pleaseUpdateApplication =
      "Please update the application to access new features";
  static const String update = "Update";
  static const String noDataAvailable = "No data available";
  static const String youHaveAllCaughtUp = "You have all caught up!";
  static const String pleaseSearchSomething = "Please search something!";
  static const String addressBook = "Address Book";
  static const String cancel = "CANCEL";
  static const String sortBy = "SORT BY";
  static const String filter = "FILTER";
  static const String logout = "LOGOUT";
  static const String confirm = "CONFIRM";
  static const String shippingAddress = "Shipping Address";
  static const String filterBy = "FILTER BY";
  static const String clearAll = "CLEAR ALL";
  static const String close = "CLOSE";
  static const String offline = "Offline";
  static const String networkConnectionLost = "Network Connection Lost!";
  static String appUpdateAvailable = "App Update Available";
  static String pleaseUpdateAppToContinue =
      "Please update your app to continue";
  static String additionalComments = "Additional Comments";
  static const String done = "Done";
  static String placeOrder = "PLACE ORDER";

  static const String welcome = "Welcome";
  static const String welcomeBack = "Welcome BACK";
  static const String welcomeMessage = "Signup to Mansory Boutique";
  static const String loginScreenMessage = "Log In to Mansory Boutique";
  static const String registerWithEmail = "REGISTER WITH EMAIL";
  static const String registerWithMobile = "REGISTER WITH MOBILE";
  static const String loginWithEmail = "LOGIN WITH EMAIL";
  static const String loginWithMobile = "LOGIN WITH MOBILE";
  static const String orLoginWith = "OR LOGIN WITH";
  static const String orRegisterWith = "OR REGISTER WITH";
  static const String forgotPassword = "Forgot password?";
  static String enterYourEmailAndPassword =
      "Enter your email address and password";
  static String emailAddress = "Email address";
  static String emailHint = "name@email.com";
  static String passwordHint = "Secure password";
  static String continueLabel = "Continue";
  static String continueAsGuest = "Continue as guest";
  static String enterYourNumberAndPassword =
      "Enter your mobile number and password";
  static String countryCode = "Country Code";
  static String mobileNumber = "Mobile Number";
  static String select = "Select";
  static String mobileNumberHint = "729 939 1930";
  static String registerNow = "REGISTER NOW";
  static String password = "Password";
  static String registerSuccess = "Registration \n Success!";
  static String completeProfile = "COMPLETE PROFILE";
  static String saveDetails = "SAVE DETAILS";
  static String addPhoto = "Add a cool photo of yours";
  static String changePhoto = "Change Photo";
  static String skipToShop = "SKIP TO SHOP";
  static String fullName = "Full Name";
  static String fullNameHint = "Enter your full name";
  static String yourBirthday = "Your Birthday";
  static String date = "27 April, 2022";
  static String country = "Country";
  static String countrySelect = "Select";
  static String verifyNow = "VERIFY NOW";
  static String verifyEmailTittle = "Verify your email";
  static String verifyEmailSubTittle =
      "We have sent a verification code to your email";
  static String verifyPhoneTittle = "Verify your PHONE";
  static String verifyPhoneSubTittle =
      "We have sent a verification code to your phone";
  static String invalidPhoneNumberFormat = "Phone Number is invalid";
  static String verifyFacebookEmail =
      "Please verify email address in facebook account";
  static String loginFailed = "Login Failed";
  static String loginEmail =
      "The email and password you entered did not match our records. Please double-check and try again.";
  static String backToLogin = "BACK TO LOGIN";
  static String submit = "SUBMIT";
  static String forgotMobile =
      "Enter your mobile number you have used while registering with Mansory Boutique";
  static String forgotEmail =
      "Enter your email address you have used while registering with Mansory Boutique";
  static String resetYourPassword = "RESET YOUR PASSWORD";
  static String btnContinue = "CONTINUE";
  static String enterNewPassword = "Enter New Password";
  static String reEnterNewPassword = "Re-enter New Password";
  static String emailVerifiedSuccess = "EMAIL VERIFIED SUCCESSFULLY!";
  static String mobileVerifiedSuccess = "MOBILE VERIFIED SUCCESSFULLY!";
  static String passwordResetSuccess = "PASSWORD Reset SUCCESSFULLY!";
  static String goBackToLogin = "GO BACK TO LOGIN";
  static String resetPassword = "RESET PASSWORD";
  static String noProductAvailable = "No Product Available";
  static String notLoggedIn = "You are not logged in, ";
  static String loginToContinue = "Login to continue";
  static String gender = "Gender";
  static String defaultLable = "Default";
  static String verifyInternetConnection =
      "Please verify your internet connection or restart application";
  static String resendOtp = "Resend OTP";
  static String didntGetOtp = "Didn't get otp?";
  static String resendOtpIn(int timeLeft) {
    return "Resend OTP in $timeLeft seconds";
  }

  //TODO: Search Screen
  static String searchProduct = "Search products";
  static String noRecommendedShoppingAvailable =
      "No Recommended Shoppings Available";

  //TODO: Wishlist Screen
  static String addItem = "+ADD ITEMS";
  static String addToBag = "ADD TO BAG";
  static String goToBag = "GO TO BAG";
  static String myWishlist = "My Wishlist";
  static String makeWish = "MAKE A WISH";
  static String emptyWishlistTittle = "Your wishlist is empty";
  static String saveYourFavourite = "Save your favourite items now";
  static String wishlistEmpty =
      "Your wishlist is empty. You can add any \n item to wishlist and buy them later";
  static String viewAllProduct = "VIEW ALL PRODUCTS";
  static String apply = "APPLY";
  static String removeProductTitle = "CONFIRMATION";
  static const String areYouSureToRemoveProductFromWishList =
      "Warning! You are about to remove this item from your Wish List. Do you want to continue?";

  //TODO: Home Screen
  static String bestSellings = "BEST SELLINGS";
  static String recentlyAdded = "RECENTLY ADDED";
  static String viewAll = "View All";
  static String exploreMore = "EXPLORE MORE";
  static String exitMessage = "Press Again to Exit";

  //TODO: Search Screen
  static String addressLabel1 = "Address 1";
  static String addressLabel2 = "Address 2";
  static String addressHint = "House No, Building Street, Area";

  //TODO: Address Screen
  static String notificationTittle = "STAY UP TO DATE";
  static String notificationDescription =
      "Enable notifications to be informed \n about MANSORY latest news and \n arrivals in boutique";
  static String turnOnNotification = "TURN ON NOTIFICATION";
  static String mayBeLater = "MAYBE LATER";
  static String notificationTittleMessage =
      "“Mansory” would like to send you notifications";
  static String notificationSubTittleMessage =
      "Notifications may include alerts and sounds. Notifications can be configured in settings.";

  //TODO: Search Screen
  static String sizeChart = "Size Chart";
  static String selectSize = "Select Size";

  //TODO: Order Success Screen
  static String orderSuccessTittle = "YOUR ORDER Placed Successfuilly";
  static String orderSuccessSubTittle =
      "You will receive order confirmation email sortly with expected delivery date on your email";
  static String orderSuccessContinueShopping = "CONTINUE SHOPPING";
  static String orderSuccessViewOrder = "View Order";
  static String orderFailureTitle = "Problem to place an order";
  static String orderFailureSubtitle = "There is a problem with your order.";

  //TODO: Delete account Screen
  static String deleteAccount = "Delete Account";
  static String keepAccount = "KEEP ACCOUNT";
  static String deleteAccountAgree = "I agree to all the";
  static String termsCondition = "terms and conditions";
  static String deleteAccountTittle = "IS it a good bye?";
  static String deleteAccountSubTittle =
      "Are you sure you don’t want to reconsider?";
  static String deleteDescription =
      "You will lose your order history, saved details and all other coupons and benefits";

  //TODO: Quote Account Screen
  static String quoteSurname = "Surname";
  static String quoteSurnameHint = "Enter your surname";
  static String quoteMessage = "Message";
  static String quoteMessageHint = "Enter your message here";

  //TODO: Manage Account Screen
  static String manageAccount = "Manage Account";
  static String manageAccountBirthday = "Birthday";
  static String manageAccountBirthdayHint = "27 April, 1993";
  static String manageAccountName = "Name";
  static String manageAccountEmail = "Email";
  static String manageAccountUpdateDetail = "UPDATE DETAILS";

  //TODO: Search Screen
  static String recentSearches = "RECENT SEARCHES";
  static String recommendedShopping = "RECOMMENDED SHOPPINGS";

  //TODO: Account Screen
  static const String account = "ACCOUNT";
  static const String orders = "Orders";
  static const String checkYourOrderStatus = "Check your order status";
  static const String checkYourPriceOnReuqetsProducts =
      "Check your price on request products";
  static const String wishList = "WishList";
  static const String yourMostLovedProducts = "Your most loved products";
  static const String savedCards = "Saved Cards";
  static const String saveYourCardsForFasterCheckout =
      "Save your cards for faster checkout";
  static const String saveAddressesForHassleFreeCheckout =
      "Save addresses for hassle-free checkout";
  static const String settings = "Settings";
  static const String manageNotificationsAndPasswordUpdateEtc =
      "Manage notifications, Password Update, etc.";
  static const String manageThemeAndCurrency = "Manage theme and currency.";
  static const String customerCare = "Customer Care";
  static const String helpRegardingYourOrders = "Help regarding your orders";
  static const String aboutUs = "ABOUT US";
  static const String privacyPolicy = "PRIVACY POLICY";
  static const String termsOfUse = "TERMS OF USE";
  static const String logoutMessage = "Are you sure you wan't to logout?";
  static const String chooseProfilePicture = "Choose Profile Picture";
  static const String gallery = "Gallery";
  static const String camera = "Camera";
  static const String changeEmail = "Change Email";

  // TODO: Change Email Screen
  static const String newEmail = "New Email";

  //TODO: Cart Screen
  static const String shoppingBag = "SHOPPING BAG";
  static const String promoCode = "PROMO CODE";
  static const String priceDetails = "PRICE DETAILS";
  static const String totalPrice = "Total Price";
  static const String quantity = "QUANTITY";
  static const String total = "Total";
  static const String viewLess = "VIEW LESS";
  static const String viewMore = "VIEW MORE";
  static const String couponCodeLabel = "Enter Coupon Code";
  static const String discount = "Discount";
  static const String vat = "VAT";
  static const String removeProduct = "Remove Product";
  static const String areYouSureToRemoveProductFromCart =
      "Are you sure to remove product from cart?";
  static String proceedToBuyItems(int items) {
    return "PROCEED TO BUY ($items ITEMS)";
  }

  static String vatAmount(String amount) {
    return "VAT ($amount%)";
  }

  static const String continueToPayment = "CONTINUE TO PAYMENT";
  static const String selectShippingAddress = "Select Shipping Address";
  static const String selectBillingAddress = "Select Billing Address";
  static const String billingAddress = "Billing Address";
  static const String billingAddressSameAsShipping =
      "Billing address is same as shipping address";
  static const String cartQuantityChangeMessageWhenCouponApplied =
      "Updating the cart quantity or remove product will remove the Coupon code, please re-enter the coupon after changing the quantity or on prodcut remove.";
  static String emptyCartTitle = "It Feels so light!";
  static String emptyCartSubTitle =
      "There is noting in your bag,\nlet’s add some items";
  static String gotoCheckout = "Go to checkout";
  static String selectAddress = "Select Address";

  static String cartStockLeft(String qty) {
    return "There is only $qty left";
  }

  // TODO: Checkout Screen
  static const String checkout = "CHECKOUT";
  static const String shippingCharge = "Shipping Charge";
  static const String paypal = "PAYPAL";
  static const String bankTransfer = "BANK TRANSFER";
  static const String selectPaymentMethod = "Select Payment Method";
  static const String pleaseAccept = "Please accept";
  static const String termsAndConditions = "Terms and Conditions";


  static String expectedDeliveryDate(String date) {
    return "Expected Delivery Date : $date";
  }

  //TODO: Tabar Items
  static const tabHome = "HOME";
  static const tabCategories = "CATEGORIES";
  static const tabBag = "BAG";
  static const tabAccount = "ACCOUNT";

  //TODO: Category Screen
  static const String categories = "CATEGORIES";

  //TODO: Complete Profile Controller
  static const String pleaseAddProfilePhoto = "Please add profile photo";

  //TODO: Dashboard Screen
  static const String popularCategories = "Popular Categories";
  static const String discoverMore = "DISCOVER MORE";
  static const String exploreMoreCategories = "Explore more categories";
  static const String moreThenTradition = "More then Tradition";
  static const String craftedWithInUAE = "Crafted with ❤️ in UAE";

  //TODO: Login Screen Controller
  static const String emailOrPasswordErrorMsg =
      "Entered email id or password is incorrect";
  static const String mobileOrPasswordErrorMsg =
      "Entered mobile number or password is incorrect";

  //TODO: Notification Screen
  static const String doNotAllow = "Don’t Allow";
  static const String allow = "Allow";
  static const String today = "Today";
  static const String thisWeek = "This Week";
  static const String older = "Older";

  //TODO: Order Screen
  static const String order = "Orders";
  static const String orderPlaced = "Order Placed";
  static const String orderDesc = "Your order will be confirmed shortly";
  static const String viewDetails = "VIEW DETAILS";
  static const String qty = "QTY";
  static const String partNo = "PART NO";
  static const String paymentStatus = "Payment Status";
  static const String orderStatus = "Order Status";
  static const String paymentMode = "Payment Mode";

  //TODO: Address Screen
  static const String makeThisDefault = "MAKE THIS DEFAULT";
  static const String edit = "EDIT";
  static const String remove = "REMOVE";
  static const String defaultAddress = "DEFAULT ADDRESS";
  static const String otherAddress = "OTHER ADDRESS";
  static const String addNewAddress = "+ADD NEW ADDRESS";
  static const String yourAddressBookIsEmpty = "Your Address Book is empty";
  static const String addYourAddressForHassleFreeExperience =
      "Add your address for hassle free experience";
  static const String addYourAddress = "+ Add your address";
  static const String addNewAddressTitle = "Add New Address";
  static const String editAddress = "Edit Address";
  static const String updateDetails = "Update Details";
  static const String office = "OFFICE";
  static const String home = "HOME";
  static const String cityLabel = "City";
  static const String cityHint = "Enter City Name";
  static const String zipcodeLabel = "Zipcode";
  static const String zipcodeHint = "Enter Zipcode";
  static const String addressTypeLabel = "Address Type";
  static const String makeThisAsMyDefaultAddress =
      "Make this as my default address";

  static String address(
      String address, String city, String country, String zipcode) {
    return "$address, $city, $country-$zipcode";
  }

  static String mobile(String mobile) {
    return "Mobile: $mobile";
  }

  static String emailData(String email) {
    return "Email: $email";
  }

  //TODO: Add Address Screen
  static const String removeAddress = "Remove Address";
  static const String areYouSureToRemoveAddress =
      "Are you sure you wan't to remove address?";
  static const String yes = "Yes";
  static const String no = "No";
  static const String areYouSureToMakeDefaultAddress =
      "Are you sure you wan't to make this address to default address?";

  //TODO: Change Password Screen
  static const String changePassword = "Change Password";
  static const String oldPasswordLabel = "Enter Old Password";
  static const String oldPasswordHint = "Old Password";
  static const String newPasswordLabel = "Enter New Password";
  static const String reNewPasswordLabel = "Re-enter New Password";
  static const String newPasswordHint = "New password";
  static const String updatePassword = "UPDATE PASSWORD";

  //TODO: Delete Account Screen
  static const String confirmation = "CONFIRMATION";
  static String deleteMessage(bool isEmailSignIn) {
    return "Warning! \nAre you sure you want to delete your account ? If yes then ${isEmailSignIn ? "fill-up your password" : "enter otp sent to your email"}.";
  }

  static const String delete = "DELETE";

  //TODO: OnBoarding Screen
  static const String previous = "Previous";
  static const String next = "Next";
  static const String skip = "Skip";
  static const String getStart = "Get Started";
  static const String screenTitleOne = "Exclusive product Range";
  static const String screenMessageOne =
      "Explore the range of exclusive products & experience the excellence of craftmanship";
  static const String screenTitleTwo = "BUY FROM APP";
  static const String screenMessageTwo =
      "Buy all exclusive product of Mansory from your finger tip via the mobile app";
  static const String screenTitleThree = "DOOR STEP DELIVERY";
  static const String screenMessageThree =
      "Get all product of delivered to your door step, No matter wherever you are";

  //TODO: Product Detail Screen
  static const String withoutVat = "WITHOUT VAT";
  static const String includingVat = "INCLUDING VAT";
  static const String color = "COLOR";
  static const String dimension = "DIMENSION";
  static const String productDetails = "PRODUCT DETAILS";
  static const String simillarProducts = "SIMILLAR PRODUCTS";
  static const String requestaQuote = "Request a Quote";
  static const String howToMeasure = "HOW TO MEASURE";
  static const String delivery = "DELIVERY";
  static const String enterDeliveryZipCode = "Enter Delivery zipcode";
  static const String deliveryEstimateMsg =
      "Usually delivered in 7 days. Enter pincode for exact delivery date";
  static const String check = "Check";
  static const String inch = "IN";
  static const String centimeter = "CM";
  static const String outOfStock = "Out Of Stock";

  //TODO: Setting Screen
  static const String pushNotification = "Push Notification";
  static const String theme = "Theme";
  static const String currency = "Currency";

  //TODO: Order Detail Screen
  static const String cancleOrder = "Cancel Order";
  static const String viewPolicy = "VIEW POLICY";
  static const String selectReasonForCancellation =
      "SELECT REASON FOR CANCELLATION";
  static const String refundDetails = "REFUND DETAILS";
  static const String totalOrderPrice = "TOTAL ORDER PRICE";
  static const String viewPriceBreakup = "VIEW PRICE BREAKUP";
  static const String updateSentTo = "UPDATE SENT TO";
  static const String returnAndExchangeOrder = "Return/Exchange Order";
  static const String returnAndExchange = "Return/Exchange";
  static const String selectReasonForReturnAndExchange =
      "SELECT REASON FOR RETURN/EXCHANGE";
  static const String status = "Status";
  static const String time = "Time";
  static const String returnText = "Return";
  static const String exchange = "Exchange";
  static const String returnExchangeConfirmation =
      "Return/Exchange confirmation";
  static const orderCancelSuccessfully = "Order Canceled Successfully!";
  static const exchangeInitiatedSuccessfully =
      "Exchange initiated Successfully!";
  static const returnInitiatedSuccessfully = "Return initiated Successfully!";

  static returnRefunDetailOnSuccess(String amount) {
    return "$amount will be refund when product will received to us back";
  }

  static cancelRefunDetailOnSuccess(String amount) {
    return "$amount will be refund within 48 hours";
  }

  static const String areYouSureToCancelOrder =
      "Are you sure you wan't to cancel order?";
  static const String priceBreakup = "PRICE BREAKUP";
  static const String paidVia = "PAID VIA";
  static String moneyRefundAfterProductReceive(String value) {
    return "$value will be refund when product will received to us back";
  }

  static const String orderCancelPolicy = "Order Cancel Policy";
  static const String orderReturnPolicy = "Order Return Policy";

  static const String returnRequest = "Return Request";
  static const String selectReasonForReturn = "SELECT REASON FOR RETURN";
  static const String returnInstruction =
      "You have to submit video,Invoice copy and damage product photo send on email or Phone no to return the product.";
  static const String downloadInvoice = "Download Invoice";
  static const String invoiceDownloading = "Downloading Invoice";
  static const String invoiceDownloadFailed = "Invoice Downloading Failed";
  static const String invoiceDownloaded = "Invoice Downloaded";
  static const String orderId = "Order Id:";
  static const String orderDate = "Order Date:";

  //TODO: OverView Screen
  static const String securePayment = "Secure Payment";
  static const String easyAndFastReturns = "Easy & Fast Returns";
  static const String reliableDelivery = "Reliable Delivery";

  //TODO: Customer Care Screen
  static const String overview = "Overview";
  static const String shipping = "Shipping";
  static const String returns = "Returns";
  static const String contactUs = "Contact Us";

  //TODO: Notification Screen
  static const String notification = "Notification";
  static const String markAllRead = "Mark All Read";

  //TODO: Orders Screen
  static const String rateProduct = "Rate Product";
  static const String trackOrder = "Track Order";

  //TODO: Product Rate Screen
  static const String submitRating = "Submit Rating";
  static const String rateRsMansoryWhite = "RATE RS MANSORY WHITE";

  //TODO: Search Screen
  static String resultFor(String name) {
    return 'Result for "$name"';
  }

  static String showingResults(int count) {
    return count == 0
        ? AppStrings.noProductAvailable
        : "Showing $count results";
  }

  static String showingResultsOutOf(int count, int total) {
    return count == 0
        ? AppStrings.noProductAvailable
        : "Showing $count of $total results";
  }

  //TODO: ContactUs Screen
  static String name = "Name";
  static String nameHint = "Enter your name";
  static String surname = "Surname";
  static String surnameHint = "Enter your surname";
  static String orderNumber = "Order Number";
  static String orderNumberHint = "Enter your order number";
  static String message = "Message";
  static String messageHint = "Enter your message";
  static String sendMessage = "Send Message";
  static String topic = "Topic";

  //TODO: Price On Request Screen
  static String priceOnRequest = "Price On Request";
}

