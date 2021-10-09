// ignore_for_file: use_key_in_widget_constructors, duplicate_ignore, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, avoid_unnecessary_containers, deprecated_member_use, camel_case_types, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'creation_game_page.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PVP_Page(),
    );
  }
}

class PVP_Page extends StatefulWidget {
  @override
  _PVP_PageState createState() => _PVP_PageState();
}

class _PVP_PageState extends State {
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
                _getCreateGameButton(context),
                _getGamesHeader(),
                _getListOfGames()
              ],
            ),
          )
        ],
      ),
    ));
  }
}

Future<List<Widget>> fetchGames() async {
  final response =
      await http.get(Uri.parse('http://142.93.162.195:8000/game/'));
  if (response.statusCode == 200) {
    var lobbies = <Widget>[];
    for (var item in jsonDecode(response.body)) {
      lobbies.add(
        RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          onPressed: () {},
          child: Row(
            children: <Widget>[
              Image(
                  image: AssetImage('assets/images/qq.png'),
                  height: 50,
                  width: 50),
              SizedBox(width: 12),
              Text('Таиров Айдар',
                  style: TextStyle(
                      fontSize: 23, color: Color.fromRGBO(216, 230, 252, 1))),
            ],
          ),
          color: Color.fromRGBO(49, 111, 204, 1),
        ),
      );
    }
    return lobbies;
  }
  return <Widget>[];
}

_getListOfGames() {
  FutureBuilder<List<Widget>>(
    future: fetchGames(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Column(children: snapshot.data);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      // By default, show a loading spinner.
      return const CircularProgressIndicator();
    },
  );
}

_getGamesHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(
        height: 100,
      ),
      Text('Свободные лобби:',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(216, 230, 252, 1)),
          textAlign: TextAlign.center),
    ],
  );
}

_getCreateGameButton(context) {
  return Container(
    width: 300,
    height: 100,
    child: RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreationGamePage()));
      },
      child: Text('Создать игру',
          style:
              TextStyle(fontSize: 25, color: Color.fromRGBO(216, 230, 252, 1))),
      color: Color.fromRGBO(49, 111, 204, 1),
    ),
  );
}

_getHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        height: 200,
      ),
      Text('PVP',
          style: TextStyle(
              fontSize: 60,
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
