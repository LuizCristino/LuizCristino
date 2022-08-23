import 'package:flutter/material.dart';
import 'package:github_pages/utils/hooks/use_breakpoints.dart';

class ValueByBreakpoint<T> {
  const ValueByBreakpoint({
    required this.mobile,
    required this.tablet,
    required this.computer,
    required this.fallback,
  });

  final T mobile;
  final T tablet;
  final T computer;
  final T fallback;
}

T useBreakpointsValue<T>(ValueByBreakpoint<T> value, BuildContext context) {
  final screenWidth = useBreakpoints(context);

  if (screenWidth.isComputer) {
    return value.computer;
  }

  if (screenWidth.isTablet) {
    return value.tablet;
  }

  if (screenWidth.isMobile) {
    return value.mobile;
  }

  return value.fallback;
}
