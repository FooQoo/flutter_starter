import 'package:flutter_line_sdk/flutter_line_sdk.dart';

class LineUserRepository {
  final LineSDK _lineSdk;

  LineUserRepository({required LineSDK lineSdk}) : _lineSdk = lineSdk;

  Future<void> logout() async {
    await _lineSdk.logout();
  }

  Future<LoginResult> login() async {
    return await _lineSdk.login();
  }

  Future<UserProfile> getProfile() async {
    return await _lineSdk.getProfile();
  }
}

final lineUserRepository = LineUserRepository(lineSdk: LineSDK.instance);
