import 'package:flutter/material.dart';
import 'package:github_pages/utils/hooks/use_breakpoints.dart';

class ValueByBreakpoint<T> {
  const ValueByBreakpoint({
    this.mobile,
    this.tablet,
    this.computer,
    required this.fallback,
  });

  final T? mobile;
  final T? tablet;
  final T? computer;
  final T fallback;
}

T useBreakpointsValue<T>(ValueByBreakpoint<T> value, BuildContext context) {
  final screenWidth = useBreakpoints(context);

  if (screenWidth.isComputer) {
    return value.computer ?? value.tablet ?? value.mobile ?? value.fallback;
  }

  if (screenWidth.isTablet) {
    return value.tablet ?? value.mobile ?? value.fallback;
  }

  if (screenWidth.isMobile) {
    return value.mobile ?? value.fallback;
  }

  return value.fallback;
}
