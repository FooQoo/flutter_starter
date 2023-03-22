import 'package:flutter/material.dart';

class NavbarItem {
  final Widget widget;
  final Icon icon;
  final String label;

  const NavbarItem(
      {required this.widget, required this.icon, required this.label});
}
