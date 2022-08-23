import 'package:flutter/material.dart';
import 'package:github_pages/widgets/split_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplitView(body: Center(child: Text('Building...')));
  }
}
