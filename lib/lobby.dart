import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/logo.dart';

class Lobby extends StatefulWidget {
  Lobby(this.router, {super.key});
  FluroRouter router;

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  List<Map> menuList = [
    {
      'index': 0,
      'category': 'first Category',
      'content': const FirstContent(),
    },
    {
      'index': 1,
      'category': 'second Category',
      'content': const SecondContent(),
    },
    {
      'index': 2,
      'category': 'third',
      'content': const ThirdContent(),
    },
    {
      'index': 3,
      'category': '네번째 메뉴',
      'content': const SecondContent(),
    },
  ];
  final scrollController = ScrollController();
  late bool initedPage;
  bool whiteNoise = false;

  initAnimation() async {
    initedPage = false;
    setState(() {});
    print('page load start');
    await Future.delayed(const Duration(milliseconds: 1500));
    print('page load finish');
    initedPage = true;
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
                duration: const Duration(milliseconds: 300),
                height: initedPage
                    ? MediaQuery.of(context).size.height / 8
                    : MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GestureDetector(
                  onTap: () {
                    reload();
                  },
                  child: const TitleLogo(),
                ),
              ),
              Flexible(
                child: Stack(
                  children: [
                    Container(
                      color: Colors.grey[300],
                      child: const Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: 250),
                          child: Text(
                            '그림 들어갈 곳',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SideMenu(menuList),
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

class SideMenu extends StatefulWidget {
  SideMenu(this.menuList, {super.key});
  List<Map> menuList;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late double menuWidth;
  late int? index;

  @override
  void initState() {
    super.initState();
    menuWidth = 0;
    index = null;
  }

  @override
  Widget build(BuildContext context) {
    double maxContentWidth = MediaQuery.of(context).size.width / 7;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: widget.menuList
              .map((menu) => MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        menuWidth = maxContentWidth;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        menuWidth = 0;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      color: Colors.grey.withOpacity(0.5),
                      width: menuWidth,
                      child: index != null && menuWidth != 0
                          ? widget.menuList[index!]['content']
                          : null,
                    ),
                  ))
              .toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.menuList
                .map((menu) => MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          index = menu['index'];
                          menuWidth = maxContentWidth;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          menuWidth = 0;
                        });
                      },
                      child: Container(
                        height:
                            menuWidth != 0 && menu['index'] == index ? 40 : 30,
                        width: menuWidth != 0 && menu['index'] == index
                            ? MediaQuery.of(context).size.width / 8
                            : MediaQuery.of(context).size.width / 10,
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent.withOpacity(0.6),
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            menuWidth != 0 && menu['index'] == index
                                ? menu['category']
                                : menu['category'].length >= 7
                                    ? menu['category'].substring(0, 6) + '...'
                                    : menu['category'],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class FirstContent extends StatelessWidget {
  const FirstContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('1. test Menu'),
      ],
    );
  }
}

class SecondContent extends StatelessWidget {
  const SecondContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('2. test Menu'),
      ],
    );
  }
}

class ThirdContent extends StatelessWidget {
  const ThirdContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('3. test Menu'),
      ],
    );
  }
}
