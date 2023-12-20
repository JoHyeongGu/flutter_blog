import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/logo.dart';
import 'package:flutter_blog/side_menu.dart';

class TitlePage extends StatefulWidget {
  const TitlePage({super.key});

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  final scrollController = ScrollController();
  late bool initedPage;
  late int titleVelocity;
  bool whiteNoise = false;

  initAnimation() async {
    initedPage = false;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 1500));
    initedPage = true;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 200));
    titleVelocity = 10;
    setState(() {});
  }

  reload() async {
    whiteNoise = true;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 50));
    whiteNoise = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    titleVelocity = 300;
    initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.grey[300]),
          Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: titleVelocity),
                height: initedPage
                    ? MediaQuery.of(context).size.height / 8
                    : MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15)),
                ),
                child: GestureDetector(
                  onTap: () {
                    reload();
                  },
                  child: TitleLogo(animation: true),
                ),
              ),
              Flexible(
                child: Stack(
                  children: [
                    Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Text(
                          '그림 들어갈 곳',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    SideMenu(),
                  ],
                ),
              ),
            ],
          ),
          if (whiteNoise) Container(color: Colors.white),
        ],
      ),
    );
  }
}
