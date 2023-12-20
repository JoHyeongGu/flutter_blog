// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_blog/route.dart';
import 'package:flutter_blog/test/test_data.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late int? index;
  late bool canSelect;

  List<Map> menuList = testSideMenuData;

  selectTag(menu) {
    setState(() {
      if (canSelect) {
        index = menu['index'];
      }
    });
  }

  unselectTag() {
    setState(() {
      index = null;
    });
  }

  initCanSelect() async {
    canSelect = false;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 300));
    canSelect = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initCanSelect();
    index = null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Content(
          menuList: menuList,
          index: index,
          selectTag: selectTag,
          unselectTag: unselectTag,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: menuList
                .map(
                  (menu) => Flexible(
                    child: TagButton(
                      menu: menu,
                      index: index,
                      selectTag: selectTag,
                      unselectTag: unselectTag,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class TagButton extends StatelessWidget {
  TagButton({
    super.key,
    required this.menu,
    required this.index,
    required this.selectTag,
    required this.unselectTag,
  });
  Map menu;
  int? index;
  Function selectTag;
  Function unselectTag;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        selectTag(menu);
      },
      onExit: (event) {
        unselectTag();
      },
      child: Container(
        height: menu['index'] == index ? 40 : 30,
        width: menu['index'] == index
            ? MediaQuery.of(context).size.width / 8
            : MediaQuery.of(context).size.width / 10,
        decoration: BoxDecoration(
          color: Colors.yellowAccent.withOpacity(0.6),
          borderRadius:
              const BorderRadius.horizontal(right: Radius.circular(5)),
        ),
        child: Center(
          child: Text(
            menu['index'] == index
                ? menu['category']
                : menu['category'].length >= 10
                    ? menu['category'].substring(0, 9) + '...'
                    : menu['category'],
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  Content({
    super.key,
    required this.menuList,
    required this.index,
    required this.selectTag,
    required this.unselectTag,
  });
  List<Map> menuList;
  int? index;
  Function selectTag;
  Function unselectTag;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        selectTag({'index': index});
      },
      onExit: (event) {
        unselectTag();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        color: Colors.grey.withOpacity(0.5),
        width: index != null ? MediaQuery.of(context).size.width / 6 : 0,
        child:
            index != null ? DetailSideMenu(menuList[index!]['content']) : null,
      ),
    );
  }
}

class DetailSideMenu extends StatelessWidget {
  DetailSideMenu(this.data, {super.key});
  Map data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: data.entries
              .map((entry) => BigCategory(entry.value, category: entry.key))
              .toList(),
        ),
      ),
    );
  }
}

class BigCategory extends StatefulWidget {
  BigCategory(this.data, {super.key, this.category = ''});
  String category;
  List<Map> data;

  @override
  State<BigCategory> createState() => _BigCategoryState();
}

class _BigCategoryState extends State<BigCategory> {
  late bool moreDetail;

  @override
  void initState() {
    super.initState();
    moreDetail = false;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          moreDetail = true;
        });
      },
      onExit: (event) {
        setState(() {
          moreDetail = false;
        });
      },
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Colors.grey.shade900),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(flex: 5, child: Text(widget.category)),
                  Flexible(
                    child: Icon(moreDetail
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
          ),
          if (moreDetail)
            Column(
              children: widget.data
                  .map(
                    (item) => GestureDetector(
                      onTap: () {
                        Routes.navigateTo(context, item['path']);
                      },
                      child: Text(item['title']),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
