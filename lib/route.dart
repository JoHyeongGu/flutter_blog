import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/detail_lobby.dart';
import 'package:flutter_blog/test/page_test.dart';
import 'package:flutter_blog/title_page.dart';

class Routes {
  static FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      '/',
      handler: Handler(
        handlerFunc: (context, Map<String, dynamic> params) =>
            const TitlePage(),
      ),
    );
    router.define(
      '/detail/:bc/:c',
      handler: Handler(
        handlerFunc: (context, Map<String, dynamic> params) {
          return DetailLobby(params['bc'][0], params['c'][0]);
        },
      ),
    );
    router.define(
      '/test',
      handler: Handler(
        handlerFunc: (context, Map<String, dynamic> params) {
          return const TestPage();
        },
      ),
    );
  }

  static void navigateTo(BuildContext context, String route) {
    router.navigateTo(context, route, transition: TransitionType.fadeIn);
  }
}