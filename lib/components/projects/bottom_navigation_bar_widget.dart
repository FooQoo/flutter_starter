import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../screen/counter.dart';
import '../../screen/map_screen.dart';
import '../../screen/profile.dart';
import '../../types/navbar_item.dart';
import '../../types/navbar_item_collection.dart';
import 'layout.dart';

final navIdxProvider = StateNotifierProvider<NavIdxManager, int>((ref) {
  return NavIdxManager();
});

class NavIdxManager extends StateNotifier<int> {
  NavIdxManager() : super(0);

  void update(int idx) {
    state = idx;
  }
}

class BottomNavigationBarWidget extends ConsumerWidget {
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIdx = ref.watch(navIdxProvider);

    return Scaffold(
        body: _collection.items[navIdx].widget,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navIdx,
          onTap: (index) => ref.read(navIdxProvider.notifier).update(index),
          items: _collection.items
              .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
              .toList(),
          type: BottomNavigationBarType.fixed,
        ));
  }
}
