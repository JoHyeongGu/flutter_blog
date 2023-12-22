import 'package:flutter_blog/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_blog/route.dart';
import 'package:flutter/material.dart';

void main() async {
  await initApp();
  runApp(const MyApp());
}

initApp () async {
  setPathUrlStrategy();
  Routes.configureRoutes();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '아홉 페이지',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      initialRoute: '/intro',
      onGenerateRoute: Routes.router.generator,
    );
  }
}
