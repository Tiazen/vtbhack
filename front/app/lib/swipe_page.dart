/// Flutter code sample for PageView
//
// Here is an example of [PageView]. It creates a centered [Text] in each of the three pages
// which scroll horizontally.

// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

void main() => runApp(const TestPage());

/// This is the main application widget.
class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: Scaffold(
        body: const MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: const <Widget>[
        Center(
          child: Text('Account'),
        ),
        Center(
          child: Text('Main Page'),
        ),
        Center(
          child: Text('News'),
        )
      ],
    );
  }
}
