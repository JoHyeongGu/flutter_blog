import 'package:flutter/material.dart';
import 'package:flutter_blog/route.dart';

class TitleLogo extends StatefulWidget {
  TitleLogo({super.key, this.animation = false});
  bool animation;

  @override
  State<TitleLogo> createState() => _TitleLogoState();
}

class _TitleLogoState extends State<TitleLogo> {
  late bool logoState1;
  late bool logoState2;

  initAnimation() async {
    logoState1 = false;
    logoState2 = false;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 300));
    logoState1 = true;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 500));
    logoState2 = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (widget.animation){
      initAnimation();
    } else{
      logoState1 = true;
      logoState2 = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Routes.navigateTo(context, '/home');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: logoState1 ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Text(
              '아홉,',
              style: TextStyle(fontSize: 25),
            ),
          ),
          AnimatedOpacity(
            opacity: logoState2 ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Text(
              ' 페이지',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
