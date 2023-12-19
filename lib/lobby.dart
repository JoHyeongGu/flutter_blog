import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.white,
                ),
                Flexible(
                  child: Container(
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
            SideMenu(menuList),
          ],
        ),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: widget.menuList
              .map((menu) => MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        menuWidth = 200;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        menuWidth = 0;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      color: Colors.grey,
                      width: menuWidth,
                      child: index != null && menuWidth != 0
                          ? widget.menuList[index!]['content']
                          : null,
                    ),
                  ))
              .toList(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.menuList
              .map((menu) => Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          index = menu['index'];
                          menuWidth = 200;
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
                        width:
                            menuWidth != 0 && menu['index'] == index ? 150 : 80,
                        color: Colors.yellowAccent.withOpacity(0.6),
                        child: Center(
                          child: Text(
                            menuWidth != 0 && menu['index'] == index
                                ? menu['category']
                                : menu['category'].length >= 6
                                    ? menu['category'].substring(0, 6) + '...'
                                    : menu['category'],
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
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
