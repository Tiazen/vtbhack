// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'sign_up_page.dart';
import 'quiz_page.dart';
import 'main_page.dart';
import 'swipe_page.dart';
import 'account_page.dart';
import 'pvp_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: PVP_Page(),
    );
  }
}
