import 'package:flutter/material.dart';
import 'package:flutter_starter/provider/AuthManager.dart';
import 'package:flutter_starter/screen/Counter.dart';
import 'package:flutter_starter/screen/Login.dart';
import 'package:flutter_starter/screen/MapScreen.dart';
import 'package:flutter_starter/screen/Profile.dart';
import 'components/projects/BottomNavigationBarWidget.dart';
import 'components/projects/Layout.dart';
import 'types/NavbarItem.dart';
import 'types/NavbarItemCollection.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static const _collection = NavbarItemCollection(
    items: [
      NavbarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          widget: Layout(title: "Home", body: Center(child: Text('Home')))),
      NavbarItem(
          icon: Icon(Icons.search),
          label: 'Map',
          widget: Layout(title: "Map", body: MapScreen())),
      NavbarItem(
          icon: Icon(Icons.punch_clock),
          label: 'Counter',
          widget: CounterScreen(title: "counter")),
      NavbarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
        widget: ProfileScreen(title: "Profile"),
      ),
    ],
  );

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
        return const BottomNavigationBarWidget(
          collection: _collection,
        );
    }
  }
}
