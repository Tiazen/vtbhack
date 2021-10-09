// ignore_for_file: use_key_in_widget_constructors, duplicate_ignore, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, avoid_unnecessary_containers, deprecated_member_use, camel_case_types, sized_box_for_whitespace
//
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreationGamePage(),
    );
  }
}

class CreationGamePage extends StatefulWidget {
  @override
  _CreationGamePageState createState() => _CreationGamePageState();
}

class _CreationGamePageState extends State {
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
                  height: 100,
                ),
                _getHeader_1(),
                SizedBox(height: 20),
                _getFirstParticipant(),
                SizedBox(height: 20),
                _getHeader_2(),
                SizedBox(height: 20),
                _getSecondParticipant(),
                SizedBox(height: 100),
                _getStartButton(),
                SizedBox(height: 50),
                _getExitButton(context)
              ],
            ),
          )
        ],
      ),
    ));
  }
}

_getExitButton(context) {
  return Container(
    width: 300,
    height: 100,
     child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0)),
        onPressed: (){
          Navigator.pop(context);
        },
        child: Text('Выйти из игры',
          style: TextStyle(fontSize: 25, color: Color.fromRGBO(216, 230, 252, 1))),
          color: Color.fromRGBO(49, 111, 204, 1),
      ),
    );
}

_getStartButton() {
  return Container(
    width: 300,
    height: 100,
     child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0)),
        onPressed: (){
        },
        child: Text('Начать игру',
          style: TextStyle(fontSize: 25, color: Color.fromRGBO(216, 230, 252, 1))),
          color: Color.fromRGBO(49, 111, 204, 1),
      ),
    );
}

_getHeader_1() {
  return Row(
    children: <Widget>[
      Text(
        'Первый игрок:',
        style: TextStyle(
        fontSize: 23, fontWeight: FontWeight.w700, color: Color.fromRGBO(49, 111, 204, 1))
      )
    ],
  );
}

_getHeader_2() {
  return Row(
    children: <Widget>[
      Text(
        'Второй игрок:',
        style: TextStyle(
        fontSize: 23, fontWeight: FontWeight.w700, color: Color.fromRGBO(49, 111, 204, 1))
      )
    ],
  );
}

_getFirstParticipant() {
  return RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    onPressed: () {},
    child: Row(
      children: <Widget>[
        Image(image: AssetImage('assets/images/qq.png'), height: 50, width: 50),
        SizedBox(width: 12),
        Text('Таиров Айдар',
            style: TextStyle(
                fontSize: 23, color: Color.fromRGBO(216, 230, 252, 1))),
      ],
    ),
    color: Color.fromRGBO(49, 111, 204, 1),
  );
}

_getSecondParticipant() {
  return RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    onPressed: () {},
    child: Row(
      children: <Widget>[
        Icon(
          Icons.person_outline,
          size: 50,
        ),
        SizedBox(width: 12),
        Text('Ожидание игрока ...',
            style: TextStyle(
                fontSize: 21, color: Color.fromRGBO(216, 230, 252, 1))),
      ],
    ),
    color: Color.fromRGBO(49, 111, 204, 1),
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
    paint.color = Color.fromRGBO(216, 230, 252, 1);
    canvas.drawPath(mainBackground, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
