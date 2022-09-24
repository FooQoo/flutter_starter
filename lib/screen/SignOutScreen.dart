import 'package:flutter/material.dart';
import 'package:flutter_starter/auth/AuthManager.dart';
import 'package:flutter_starter/components/projects/Layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignOutScreen extends ConsumerWidget {
  const SignOutScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Layout(
      title: title,
      body: Center(
        child: ElevatedButton(
          onPressed: () => ref.read(authManagerProvider).signOut(),
          child: const Text('Signout'),
        ),
      ),
    );
  }
}
