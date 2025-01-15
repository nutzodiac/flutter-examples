import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static Storage? _storage;
  static const String tokenKey = "TOKEN_KEY";
  static const String pinKey = "PIN_KEY";
  static Storage getInstance() {
    _storage ??= Storage();
    return _storage!;
  }

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  static IOSOptions _getIOSOptions([String? accountName]) => IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
    accountName: accountName
  );

  final storage = FlutterSecureStorage(
    aOptions: _getAndroidOptions(),
    iOptions: _getIOSOptions()
  );

  existsStorageData(String key) async {
    return await storage.containsKey(
      key: key, 
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions()
    );
  }

  writeStorageData(String key, String value) async {
    return await storage.write(
      key: key, 
      value: value,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions()
    );
  }

  readStorageData(String key) async {
    return await storage.read(
      key: key,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions()
    );
  }

  deleteStorageData(String key) async {
    return await storage.delete(
      key: key,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions()
    );
  }

  deleteStorageAll() async {
    return await storage.deleteAll(
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions()
    );
  }

  Future<String?> getToken() async {
    return await storage.read(
      key: "TOKEN_KEY",
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions()
    );
  }

  logout() async {
    return await storage.deleteAll(
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions()
    );
  }
}