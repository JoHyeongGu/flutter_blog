import 'package:flutter/material.dart';
import 'package:flutter_blog/route.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  await initApp();
  runApp(const MyApp());
}

initApp () async {
  setPathUrlStrategy();
  Routes.configureRoutes();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '아홉 페이지',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      initialRoute: '/',
      onGenerateRoute: Routes.router.generator,
    );
  }
}
