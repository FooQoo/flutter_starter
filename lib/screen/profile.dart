import 'package:flutter/material.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:flutter_starter/provider/auth_manager.dart';
import 'package:flutter_starter/components/projects/layout.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/profile_manager.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key, required this.title});

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
    final AsyncValue<UserProfile> userProfile = ref.watch(userProfileProvider);

    return Layout(
      title: title,
      body: Center(
        // child: ElevatedButton(
        //   onPressed: () => ref.read(authManagerProvider).signOut(),
        //   child: const Text('Signout'),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildContent(userProfile, ref.read(authManagerProvider)),
        ),
      ),
    );
  }

  List<Widget> buildContent(
      AsyncValue<UserProfile> userProfile, AuthManager authManager) {
    return userProfile.when(
      data: (userProfile) => <Widget>[
        _buildImage(userProfile.pictureUrl),
        const SizedBox(height: 20.0),
        Text(
          userProfile.displayName,
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        _buildSignout(authManager)
      ],
      loading: () => <Widget>[const Center(child: CircularProgressIndicator())],
      error: (error, stackTrace) =>
          <Widget>[Center(child: _buildSignout(authManager))],
    );
  }

  Widget _buildSignout(AuthManager authManager) {
    return ElevatedButton(
      onPressed: () => authManager.signOut(),
      child: const Text('Signout'),
    );
  }

  Widget _buildImage(String? url) {
    return url?.isNotEmpty == true
        ? CircleAvatar(
            radius: 50.0,
            backgroundImage: Image.network(url ?? '').image,
          )
        : const Icon(Icons.account_circle, size: 100.0);
  }
}
