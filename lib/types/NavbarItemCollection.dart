import 'package:flutter/material.dart';

import 'NavbarItem.dart';

class NavbarItemCollection {
  final List<NavbarItem> items;

  const NavbarItemCollection({required this.items});

  List<Widget> get widgets => items.map((e) => e.widget).toList();
}
