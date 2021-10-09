// ignore_for_file: use_key_in_widget_constructors, duplicate_ignore, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, avoid_unnecessary_containers, deprecated_member_use
//
import 'package:flutter/material.dart';
import 'main_page.dart';


void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State {
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
                _getQuestionNumber(),
                SizedBox(
                  height: 40,
                ),
                _getQuestionText(),
                SizedBox(
                  height: 60,
                ),
                _getAnswer_1(context),
                SizedBox(
                  height: 40,
                ),
                _getAnswer_2(context),
                SizedBox(
                  height: 40,
                ),
                _getAnswer_3(context),
                SizedBox(
                  height: 40,
                ),
                _getAnswer_4(context),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

_getAnswer_1(context) {
  return Row(
    children: <Widget>[
      GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
            _getShowDialog(context);
          },
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(20, 49, 92, 1),
            radius: 15,
            child: Icon(Icons.check),
          )),
      SizedBox(
        width: 15,
      ),
      Text(
        '1) Lorem ipsum dolor',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(216, 230, 252, 1)),
      ),
    ],
  );
}

_getAnswer_2(context) {
  return Row(
    children: <Widget>[
      GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
                _getShowDialog(context);
          },
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(20, 49, 92, 1),
            radius: 15,
            child: Icon(Icons.check),
          )),
      SizedBox(
        width: 15,
      ),
      Text(
        '2) Lorem ipsum dolor',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(216, 230, 252, 1)),
      ),
    ],
  );
}

_getAnswer_3(context) {
  return Row(
    children: <Widget>[
      GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
                _getShowDialog(context);
          },
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(20, 49, 92, 1),
            radius: 15,
            child: Icon(Icons.check),
          )),
      SizedBox(
        width: 15,
      ),
      Text(
        '3) Lorem ipsum dolor',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(216, 230, 252, 1)),
      ),
    ],
  );
}

_getAnswer_4(context) {
  return Row(
    children: <Widget>[
      GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
                _getShowDialog(context);
          },
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(20, 49, 92, 1),
            radius: 15,
            child: Icon(Icons.check),
          )),
      SizedBox(
        width: 15,
      ),
      Text(
        '4) Lorem ipsum dolor',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(216, 230, 252, 1)),
      ),
    ],
  );
}

_getQuestionNumber() {
  return Flexible(
    child: Text(
      'Вопрос №1',
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(216, 230, 252, 1)),
    ),
  );
}

_getQuestionText() {
  return Container(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam lacinia a arcu eget vestibulum. Integer sit amet mi quis quam accumsan commodo. Duis tortor lectus, euismod ac tristique id, semper vel lorem. Sed ac lectus et dolor euismod scelerisque. Morbi faucibus pharetra tincidunt.',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(216, 230, 252, 1)),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Color.fromRGBO(49, 111, 204, 1),
          borderRadius: BorderRadius.circular(15)));
}

_getShowDialog(context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Правильный ответ:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(20, 49, 92, 1)),
        ),
        content: const Text(
          'Lorem ipsum dolor fdwefwe',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(20, 49, 92, 1)),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'ОК',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(20, 49, 92, 1)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text(
              'Вернуться к вопросу',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(20, 49, 92, 1)),
            ),
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => QuizPage()));
            },
          ),
        ],
      );
    },
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
