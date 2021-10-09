// ignore_for_file: use_key_in_widget_constructors, duplicate_ignore, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, avoid_unnecessary_containers, deprecated_member_use
//
import 'package:app/pvp_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State {
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
                  height: 30,
                ),
                _getLogoAndHeader(),
                SizedBox(
                  height: 150,
                ),
                _getFirstButton(context),
                SizedBox(
                  height: 30,
                ),
                _getSecondButton(),
                SizedBox(
                  height: 30,
                ),
                _getThirdButton(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

_getLogoAndHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Image(
          image: AssetImage('assets/images/logo2.png'), height: 80, width: 80),
      Text(
        'QUIZEY',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Color.fromRGBO(20, 49, 92, 1)),
      ),
    ],
  );
}

_getFirstButton(context) {
  // ignore: sized_box_for_whitespace
  return Container(
    width: 300,
    height: 100,
     child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0)),
        onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => PVP_Page()));
        },
        child: Text('Battle Royale',
          style: TextStyle(fontSize: 25, color: Color.fromRGBO(216, 230, 252, 1))),
          color: Color.fromRGBO(34, 80, 148, 1),
      ),
    );
}

_getSecondButton() {
  // ignore: sized_box_for_whitespace
  return Container(
    width: 300,
    height: 100,
     child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0)),
        onPressed: (){},
        child: Text('PVP',
          style: TextStyle(fontSize: 25, color: Color.fromRGBO(216, 230, 252, 1))),
          color: Color.fromRGBO(34, 80, 148, 1),
      ),
    );
}

_getThirdButton() {
  // ignore: sized_box_for_whitespace
  return Container(
    width: 300,
    height: 100,
     child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0)),
        onPressed: (){},
        child: Text('Education',
          style: TextStyle(fontSize: 25, color: Color.fromRGBO(216, 230, 252, 1))),
          color: Color.fromRGBO(34, 80, 148, 1),
      )
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
