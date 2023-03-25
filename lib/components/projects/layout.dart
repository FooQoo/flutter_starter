import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Layout extends ConsumerWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  const Layout(
      {super.key,
      required this.title,
      required this.body,
      this.floatingActionButton});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: body,
        floatingActionButton: floatingActionButton,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(title),
        ));
  }
}
