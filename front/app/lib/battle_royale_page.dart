// ignore_for_file: use_key_in_widget_constructors, duplicate_ignore, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, avoid_unnecessary_containers, deprecated_member_use, camel_case_types, sized_box_for_whitespace
//
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BattleRoyale(),
    );
  }
}

class BattleRoyale extends StatefulWidget {
  @override
  _BattleRoyaleState createState() => _BattleRoyaleState();
}

class _BattleRoyaleState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
      painter: Background(),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: <Widget>[
                _getHeader(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

_getVideo() {

}

_getHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        height: 200,
      ),
      Text('Battle Royale',
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Color.fromRGBO(11, 29, 55, 1)),
          textAlign: TextAlign.center),
    ],
  );
}

class Background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Color.fromRGBO(34, 80, 148, 1);
    canvas.drawPath(mainBackground, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
