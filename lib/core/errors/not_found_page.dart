import 'package:flutter/material.dart';

/// Page when url is invalid
class NotFoundPage extends StatelessWidget {
  /// Constructor
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('404 Not found!')));
  }
}
