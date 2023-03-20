import 'package:flutter/cupertino.dart';
import 'package:flutter_starter/repository/SecureStorageRepository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/LineUserRepository.dart';

final isAlreadyLoginProvider = FutureProvider<bool>((ref) async {
  // 瞬時に切り替えると画面がちらつくので、3秒待つ
  await Future.delayed(const Duration(milliseconds: 3000));
  return await secureStorageRepository.read('LINE_ACCESS_TOKEN') != null;
});

final authManagerProvider = ChangeNotifierProvider<AuthManager>(
  (ref) {
    final isLogin = ref.watch(isAlreadyLoginProvider);
    return isLogin.when(
        data: (data) => AuthManager.loadComplete(data),
        error: (_, __) => AuthManager.init(),
        loading: () => AuthManager.loading());
  },
);

class AuthManager with ChangeNotifier {
  AuthStatus status;

  AuthManager([this.status = AuthStatus.logout]);

  static AuthManager loading() => AuthManager(AuthStatus.loading);

  static AuthManager loadComplete(isLogin) =>
      isLogin ? AuthManager(AuthStatus.login) : AuthManager(AuthStatus.logout);

  static AuthManager init() => AuthManager(AuthStatus.logout);

  Future<void> signInWithLine() async {
    final result = await lineUserRepository.login();

    secureStorageRepository.write(
        'LINE_ACCESS_TOKEN', result.accessToken.value);

    status = AuthStatus.login;
    notifyListeners();
  }

  // ログアウト処理
  Future<void> signOut() async {
    // LINEでログアウトする
    await lineUserRepository.logout();
    secureStorageRepository.delete('LINE_ACCESS_TOKEN');
    status = AuthStatus.logout;
    notifyListeners();
  }
}

enum AuthStatus { logout, login, loading }
