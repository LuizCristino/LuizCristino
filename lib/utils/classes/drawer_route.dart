import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DrawerRoute {
  const DrawerRoute({
    required this.path,
    required this.route,
    required this.title,
    required this.activeIcon,
    required this.inactiveIcon,
  });

  final String path;
  final PageRouteInfo<dynamic> route;
  final String title;
  final IconData activeIcon;
  final IconData inactiveIcon;

  bool isActive(String currentPath) {
    return RegExp('$path\$').hasMatch(currentPath);
  }

  IconData getIcon(String currentPath) {
    return isActive(currentPath) ? activeIcon : inactiveIcon;
  }
}
