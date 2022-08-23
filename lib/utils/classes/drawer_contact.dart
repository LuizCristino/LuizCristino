import 'package:flutter/material.dart';

class DrawerContact {
  const DrawerContact({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;
}
