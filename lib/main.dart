import 'package:flutter/material.dart';
import 'package:github_pages/config/routers/app_router.gr.dart';
import 'package:github_pages/config/themes/dark_theme.dart';
import 'package:github_pages/config/themes/light_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (context, router) => router!,
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
