import 'package:flutter/material.dart';
import 'package:github_pages/constants/breakpoints.dart';

class ScreenWidth {
  const ScreenWidth({
    required this.isMobile,
    required this.isTablet,
    required this.isComputer,
    required this.currentWidth,
  });

  final bool isMobile;
  final bool isTablet;
  final bool isComputer;
  final double currentWidth;

  ScreenWidth copyWith({
    bool? isMobile,
    bool? isTablet,
    bool? isComputer,
    double? currentWidth,
  }) {
    return ScreenWidth(
      isMobile: isMobile ?? this.isMobile,
      isTablet: isTablet ?? this.isTablet,
      isComputer: isComputer ?? this.isComputer,
      currentWidth: currentWidth ?? this.currentWidth,
    );
  }
}

ScreenWidth useBreakpoints(BuildContext context) {
  final currentWidth = MediaQuery.of(context).size.width;

  return ScreenWidth(
    isMobile: currentWidth < Breakpoints.tablet,
    isTablet: !(currentWidth < Breakpoints.tablet) &&
        currentWidth < Breakpoints.computer,
    isComputer: currentWidth >= Breakpoints.computer,
    currentWidth: currentWidth,
  );
}
