import 'package:flutter/material.dart';

var testSideMenuData = <Map>[
  {
    'index': 0,
    'category': 'Develop',
    'content': {
      'Python': [
        {'title': '웹 스크레이핑', 'path': '/detail/python/crawling'},
        {'title': '인공지능', 'path': '/detail/python/ai'},
        {'title': 'Studying Language', 'path': '/detail/python/study'},
      ],
      'NodeJS': [
        {'title': '비동기 (Async)', 'path': '/detail/nodejs/async'},
        {'title': 'Studying Language', 'path': '/detail/nodejs/study'},
      ],
      'Flutter': [
        {'title': 'package 사용 설명서', 'path': '/detail/flutter/package'},
        {'title': 'Firebase', 'path': '/detail/flutter/firebase'},
        {'title': 'Widget 연구', 'path': '/detail/flutter/widget'},
        {'title': 'Studying dart', 'path': '/detail/flutter/dart'},
      ],
    },
  },
  {
    'index': 1,
    'category': 'Edit Art',
    'content': {
      'After Effect': [
        {'title': 'Effect Video', 'path': '/detail/after-effect/effect'},
      ],
      'Editing Sites': [
        {'title': 'Polaris office Web', 'path': '/detail/edit-site/polaris'},
        {'title': 'Pixlr Editor', 'path': '/detail/edit-site/pixlr'},

      ],
      'Drawing Picture': [
        {'title': 'Hand-Made', 'path': '/detail/drawing/handmade'},
        {'title': 'FlipaClip', 'path': '/detail/drawing/flipaclip'},
      ],
    },
  },
  {
    'index': 2,
    'category': 'Music',
    'content': {
      'Edit Program': [
        {'title': 'Studio One 5', 'path': '/detail/music-program/studio-one-5'},
      ],
      'Lyrics': [
        {'title': '작사 공부', 'path': '/detail/lyrics/studying'},
        {'title': '가사 만들기 놀이', 'path': '/detail/lyrics/playing'},
      ],
    },
  },
  {
    'index': 3,
    'category': 'Idea Banking',
    'content': {
      'Game Idea': [
        {'title': 'About Space', 'path': '/detail/game-idea/about-space'},
      ],
      'Application Idea': [
        {'title': 'More Person', 'path': '/detail/app-idea/more-person'},
      ],
      'Mind Set Idea': [
        {'title': '나에게 주는 조언', 'path': '/detail/mind-idea/advice'},
      ],
    },
  },
];

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
