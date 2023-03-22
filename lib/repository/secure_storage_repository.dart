import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepository {
  final FlutterSecureStorage _storage;

  SecureStorageRepository({required FlutterSecureStorage storage})
      : _storage = storage;

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }
}

final secureStorageRepository =
    SecureStorageRepository(storage: const FlutterSecureStorage());
