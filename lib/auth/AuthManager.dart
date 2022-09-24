import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

final authManagerProvider = ChangeNotifierProvider<AuthManager>(
  (ref) {
    return AuthManager();
  },
);

class AuthManager with ChangeNotifier {
  bool isLoggedIn = false;
  final _lineSdk = LineSDK.instance; // LINE SDKのインスタンス

  Future<void> signInWithLine() async {
    // 後ほどここにログイン処理を実装していく
    final result = await _lineSdk.login();
    final lineUserId = result.userProfile?.userId;
    print(lineUserId);
    isLoggedIn = true;
    notifyListeners();
  }

  // ログアウト処理
  Future<void> signOut() async {
    // LINEでログアウトする
    await _lineSdk.logout();
    isLoggedIn = false;
    notifyListeners();
  }
}
