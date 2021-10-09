// ignore_for_file: use_key_in_widget_constructors, duplicate_ignore, prefer_const_constructors, prefer_const_literals_to_create_immutables
///
import 'package:flutter/material.dart';
import 'main_page.dart';


void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State {
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
                _getHeader(),
                _getInputs(),
                _getButton(context),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

_getButton(context) {
  return Expanded(
    flex: 2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Регистрация',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Color.fromRGBO(216, 230, 252, 1)),
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainPage()));
            },
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(216, 230, 252, 1),
              radius: 35,
              child: Image.asset('assets/images/logo.png'),
              ),
            ),
      ],
    ),
  );
}

_getInputs() {
  return Expanded(
    flex: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(216, 230, 252, 1))),
            labelText: 'Имя',
            labelStyle: TextStyle(color: Color.fromRGBO(216, 230, 252, 1)),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(216, 230, 252, 1))),
            labelText: 'Фамилия',
            labelStyle: TextStyle(color: Color.fromRGBO(216, 230, 252, 1)),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(216, 230, 252, 1))),
            labelText: 'E-mail',
            labelStyle: TextStyle(color: Color.fromRGBO(216, 230, 252, 1)),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(216, 230, 252, 1))),
            labelText: 'Пароль',
            labelStyle: TextStyle(color: Color.fromRGBO(216, 230, 252, 1)),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromRGBO(216, 230, 252, 1))),
            labelText: 'Возраст',
            labelStyle: TextStyle(color: Color.fromRGBO(216, 230, 252, 1)),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}

_getHeader() {
  return Expanded(
    flex: 1,
    child: Container(
      alignment: Alignment.topCenter,
      child: Text(
        'Создайте аккаунт',
        style: TextStyle(color: Color.fromRGBO(216, 230, 252, 1), fontSize: 37),
      ),
    ),
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
