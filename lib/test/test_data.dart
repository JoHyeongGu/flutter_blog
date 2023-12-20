import 'package:flutter/material.dart';

var testSideMenuData = <Map>[
  {
    'index': 0,
    'category': 'Develop',
    'content': {
      'Python': [
        {'title': '웹 스크레이핑', 'path': '/detail?bc=python&c=crawling'},
        {'title': '인공지능', 'path': '/detail?bc=python&c=ai'},
        {'title': 'Studying Language', 'path': '/detail?bc=python&c=study'},
      ],
      'NodeJS': [
        {'title': '비동기 (Async)', 'path': '/detail?bc=nodejs&c=async'},
        {'title': 'Studying Language', 'path': '/detail?bc=nodejs&c=study'},
      ],
      'Flutter': [
        {'title': 'package 사용 설명서', 'path': '/detail?bc=flutter&c=package'},
        {'title': 'Firebase', 'path': '/detail?bc=flutter&c=firebase'},
        {'title': 'Widget 연구', 'path': '/detail?bc=flutter&c=widget'},
        {'title': 'Studying dart', 'path': '/detail?bc=flutter&c=dart'},
      ],
    },
  },
  {
    'index': 1,
    'category': 'Edit Art',
    'content': {
      'After Effect': [
        {'title': 'Effect Video', 'path': '/detail?bc=after-effect&c=effect'},
      ],
      'Editing Sites': [
        {'title': 'Polaris office Web', 'path': '/detail?bc=edit-site&c=polaris'},
        {'title': 'Pixlr Editor', 'path': '/detail?bc=edit-site&c=pixlr'},

      ],
      'Drawing Picture': [
        {'title': 'Hand-Made', 'path': '/detail?bc=drawing&c=handmade'},
        {'title': 'FlipaClip', 'path': '/detail?bc=drawing&c=flipaclip'},
      ],
    },
  },
  {
    'index': 2,
    'category': 'Music',
    'content': {
      'Edit Program': [
        {'title': 'Studio One 5', 'path': '/detail?bc=music-program&c=studio-one-5'},
      ],
      'Lyrics': [
        {'title': '작사 공부', 'path': '/detail?bc=lyrics&c=studying'},
        {'title': '가사 만들기 놀이', 'path': '/detail?bc=lyrics&c=playing'},
      ],
    },
  },
  {
    'index': 3,
    'category': 'Idea Banking',
    'content': {
      'Game Idea': [
        {'title': 'About Space', 'path': '/detail?bc=game-idea&c=about-space'},
      ],
      'Application Idea': [
        {'title': 'More Person', 'path': '/detail?bc=app-idea&c=more-person'},
      ],
      'Mind Set Idea': [
        {'title': '나에게 주는 조언', 'path': '/detail?bc=mind-idea&c=advice'},
      ],
    },
  },
];
