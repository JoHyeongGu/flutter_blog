import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/detail_lobby.dart';
import 'package:flutter_blog/title_page.dart';

class Routes {
  static FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      '/',
      handler: Handler(
        handlerFunc: (context, Map<String, dynamic> params) =>
            TitlePage(animation: false),
      ),
    );
    router.define(
      '/home',
      handler: Handler(
        handlerFunc: (context, Map<String, dynamic> params) =>
            TitlePage(animation: false),
      ),
    );
    router.define(
      '/intro',
      handler: Handler(
        handlerFunc: (context, Map<String, dynamic> params) => TitlePage(),
      ),
    );
    router.define(
      '/detail',
      handler: Handler(
        handlerFunc: (context, Map<String, dynamic> params) {
          return DetailLobby(params['bc'][0], params['c'][0]);
        },
      ),
    );
  }

  static void navigateTo(BuildContext context, String route) {
    router.navigateTo(context, route, transition: TransitionType.fadeIn);
  }
}
