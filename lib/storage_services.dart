import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageServices {
  static final prefs = FlutterSecureStorage();
  static const accessToken = 'access_token';
  static const refreshToken = 'refresh_token';
  static const expiryIn = 'expiry_in';

  static Future<void> saveAccessToken(
    String atoken,
    String rToken,
    String expiryIn,
  ) async {
    await prefs.write(key: accessToken, value: atoken);
    await prefs.write(key: refreshToken, value: rToken);
    await prefs.write(key: expiryIn, value: expiryIn);
  }

  static String get accessTokenValue => prefs.read(key: accessToken) as String;
  static String get refreshTokenValue =>
      prefs.read(key: refreshToken) as String;
  static String get expiryInValue => prefs.read(key: expiryIn) as String;
}
