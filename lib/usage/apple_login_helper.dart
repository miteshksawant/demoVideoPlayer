import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:get/get.dart';

class AppleLoginHelper {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<UserCredential?> login() async {
    try {
      AuthorizationCredentialAppleID authCred =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: GetPlatform.isWeb
            ? WebAuthenticationOptions(
                clientId: "com.lb.learnbuddhism",
                redirectUri: Uri(
                    host: Uri.base.host,
                    scheme: Uri.base.scheme,
                    path: '/login'),
              )
            : null,
      );

      final OAuthProvider oAuthProvider = OAuthProvider("apple.com");

      final AuthCredential credential = oAuthProvider.credential(
        idToken: authCred.identityToken,
        accessToken: authCred.authorizationCode,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> logout() async {
    FirebaseAuth.instance.signOut();
    return;
  }
}
