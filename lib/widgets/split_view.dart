import 'package:flutter/material.dart';
import 'package:github_pages/constants/breakpoints.dart';
import 'package:github_pages/utils/hooks/use_breakpoints.dart';
import 'package:github_pages/widgets/app_drawer.dart';

const double drawerWidth = 240;

class SplitView extends StatelessWidget {
  const SplitView({
    required this.body,
    super.key,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final screenWidth = useBreakpoints(context);

    if (screenWidth.isMobile) {
      return Scaffold(
        appBar: AppBar(),
        drawer: const SizedBox(
          width: drawerWidth,
          child: Drawer(child: AppDrawer()),
        ),
        body: body,
      );
    }

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(width: drawerWidth, child: AppDrawer()),
          const VerticalDivider(width: 0),
          Expanded(child: body)
        ],
      ),
    );
  }
}
