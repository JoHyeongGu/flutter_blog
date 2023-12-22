import 'package:flutter/material.dart';
import 'package:flutter_blog/logo.dart';
import 'package:flutter_blog/side_menu.dart';

class DetailLobby extends StatefulWidget {
  DetailLobby(this.bigCategory, this.category, {super.key});
  String? bigCategory;
  String? category;

  @override
  State<DetailLobby> createState() => _DetailLobbyState();
}

class _DetailLobbyState extends State<DetailLobby> {

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
                height: MediaQuery.of(context).size.height / 8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(15)),
                ),
                child: TitleLogo(),
              ),
              Flexible(
                child: Stack(
                  children: [
                    Container(
                      color: Colors.grey[300],
                      child: Center(
                        child: Text(
                          '${widget.bigCategory}의 ${widget.category}의\n게시물들 보이는 곳',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    const SideMenu(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
