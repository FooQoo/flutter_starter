import 'package:flutter/material.dart';
import 'package:flutter_starter/provider/auth_manager.dart';
import 'package:flutter_starter/screen/login.dart';
import 'components/projects/bottom_navigation_bar_widget.dart';
import 'package:logger/logger.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final logger = Logger();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authManager = ref.watch(authManagerProvider);

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: _buildHome(authManager));
  }

  Widget _buildHome(AuthManager authManager) {
    switch (authManager.status) {
      case AuthStatus.loading:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case AuthStatus.logout:
        return const SignInScreen();
      case AuthStatus.login:
        return BottomNavigationBarWidget();
    }
  }
}
