import 'package:flutter/material.dart';

import '../../types/navbar_item_collection.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key, required this.collection});

  final NavbarItemCollection collection;

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.collection.widgets[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: widget.collection.items
              .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
              .toList(),
          type: BottomNavigationBarType.fixed,
        ));
  }
}
