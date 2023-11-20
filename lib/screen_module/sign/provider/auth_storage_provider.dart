import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  static const storage = FlutterSecureStorage();
  static const KEY = "SECURE_STORAGE_AUTH_TOKEN";

  static Future<String?> getAccessToken() async {
    return await storage.read(key: KEY);
  }

  static Future<void> setAccessToken(String accessToken) async {
    await storage.write(key: KEY, value: accessToken);
  }

  static Future<void> deleteAccessToken() async {
    await storage.delete(key: KEY);
  }
}
