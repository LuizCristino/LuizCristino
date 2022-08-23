import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Page when url is invalid
class NotFoundPage extends StatelessWidget {
  /// Constructor
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyText1!.color;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '404 - Not found',
              style: TextStyle(fontSize: 32, letterSpacing: 1.25),
            ),
            const SizedBox(height: 16),
            const Text(
              "We didn't find your page,",
              style: TextStyle(fontSize: 24, letterSpacing: 1.25),
            ),
            const Text(
              'but found you a cat!',
              style: TextStyle(fontSize: 24, letterSpacing: 1.25),
            ),
            Lottie.asset('assets/lotties/sleeping_cat.json'),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                onPrimary: textColor,
                padding: const EdgeInsets.all(16),
              ),
              child: const Text(
                'Go Back',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
