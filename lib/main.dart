import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/lobby.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_blog/test/page_test.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

List<Map> pageList = [
  {
    'path': '/homepage',
    'widget': const TestPage(),
    'title': '홈페이지 로비',
    'description': '다양한 메뉴가 있는 홈페이지의 로비를 만들어보자',
  },
];

initRouter() {
  FluroRouter router = FluroRouter();
  for (Map page in pageList) {
    router.define(
      page['path'],
      handler: Handler(
        handlerFunc: (context, params) {
          return page['widget'];
        },
      ),
      transitionType: TransitionType.cupertinoFullScreenDialog,
    );
  }
  return router;
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  FluroRouter router = initRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '아홉 페이지',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      onGenerateRoute: router.generator,
      routes: {
        '/': (context) => Lobby(router),
      },
    );
  }
}
