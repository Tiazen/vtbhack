// ignore_for_file: use_key_in_widget_constructors, duplicate_ignore, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, avoid_unnecessary_containers, deprecated_member_use, sized_box_for_whitespace
///
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AccountPage(),
    );
  }
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State {
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
                SizedBox(
                  height: 60,
                ),
                _getUserInfo(),
                SizedBox(
                  height: 50,
                ),
                _getInvestmetsButton(),
                SizedBox(
                  height: 50,
                ),
                _getTitleBalance(),
                SizedBox(
                  height: 50,
                ),
                _getBalance(),
                SizedBox(
                  height: 50,
                ),
                _getTitleLevel(),
                SizedBox(
                  height: 50,
                ),
                _getLevel(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

_getLevel() {
  return RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    onPressed: () {},
    child: Row(
      children: <Widget>[
        Icon(Icons.looks_5_outlined, size: 70.0),
        SizedBox(width: 12),
        Text('100 / 1000 очков',
            style: TextStyle(
                fontSize: 23, color: Color.fromRGBO(216, 230, 252, 1))),
      ],
    ),
    color: Color.fromRGBO(49, 111, 204, 1),
  );
}

_getBalance() {
  return RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    onPressed: () {},
    child: Row(
      children: <Widget>[
        Image(
            image: AssetImage('assets/images/logo.png'),
            height: 70,
            width: 70),
        SizedBox(width: 12),
        Text('1000.00 рублей',
            style: TextStyle(
                fontSize: 23, color: Color.fromRGBO(216, 230, 252, 1))),
      ],
    ),
    color: Color.fromRGBO(49, 111, 204, 1),
  );
}

_getInvestmetsButton() {
  return RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    onPressed: () {},
    child: Row(
      children: <Widget>[
        Image(
            image: AssetImage('assets/images/logo2.png'),
            height: 70,
            width: 70),
        SizedBox(width: 12),
        Text('Мои инвестиции',
            style: TextStyle(
                fontSize: 23, color: Color.fromRGBO(216, 230, 252, 1))),
      ],
    ),
    color: Color.fromRGBO(49, 111, 204, 1),
  );
}

_getTitleBalance() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text('Ваш баланс:',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(216, 230, 252, 1))),
    ],
  );
}

_getTitleLevel() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text('Ваш уровень:',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(216, 230, 252, 1))),
    ],
  );
}

_getUserInfo() {
  return Row(children: <Widget>[
    Image(image: AssetImage('assets/images/qq.png'), height: 80, width: 80),
    SizedBox(width: 30),
    Column(children: <Widget>[
      Text('Айдар Таиров',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(216, 230, 252, 1))),
    ])
  ]);
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
