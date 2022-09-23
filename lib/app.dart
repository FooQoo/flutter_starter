import 'package:flutter/material.dart';
import 'package:flutter_starter/screen/Counter.dart';
import 'BottomNavigationBarWidget.dart';
import 'types/NavbarItem.dart';
import 'types/NavbarItemCollection.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const _collection = NavbarItemCollection(
    items: [
      NavbarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        widget: Center(
          child: Text('Home'),
        ),
      ),
      NavbarItem(
        icon: Icon(Icons.search),
        label: 'Search',
        widget: Center(
          child: Text('Search'),
        ),
      ),
      NavbarItem(
          icon: Icon(Icons.punch_clock),
          label: 'Counter',
          widget: CounterScreen(title: "counter")),
      NavbarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
        widget: Center(
          child: Text('Profile'),
        ),
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        home: const BottomNavigationBarWidget(
          collection: _collection,
        ));
  }
}
