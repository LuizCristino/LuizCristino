import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    this.padding = const EdgeInsets.all(8),
    this.onPressed,
    this.icon,
    this.splashColor,
  });

  final EdgeInsets padding;
  final GestureTapCallback? onPressed;
  final Widget? icon;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        splashColor: splashColor,
        child: Padding(
          padding: padding,
          child: icon,
        ),
      ),
    );
  }
}
