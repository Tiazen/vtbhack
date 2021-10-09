// ignore_for_file: use_key_in_widget_constructors, duplicate_ignore, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, avoid_unnecessary_containers, deprecated_member_use, avoid_print, unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, sized_box_for_whitespace

import 'dart:convert';

import 'package:app/pvp_page.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.channel}) : super(key: key);
  final WebSocketChannel channel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(channel: channel),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key, required this.channel}) : super(key: key);
  final WebSocketChannel channel;

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var counter = 0;
  var flag = false;
  var prev_quest;
  var right_ans = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
      painter: Background(),
      child: Stack(
        children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PVP_Page()));
              },
              child: Container(
                padding: const EdgeInsets.only(left: 25.0, top: 45.0),
                child: Icon(Icons.arrow_back_ios, color: Colors.white,),
              ),
            ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: StreamBuilder(
                  stream: widget.channel.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = json.decode(snapshot.data.toString());
                      if (data.containsKey('game')) {
                        return Center(
                          child: Container(
                          width: 300,
                          height: 100,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                            onPressed: () {},
                            child: Text(
                                'Правильных ответов: $right_ans / $counter',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(11, 29, 55, 1))),
                            color: Color.fromRGBO(137, 181, 247, 1),
                          ),
                        ));
                      } else {
                        if (prev_quest != data["new_question"]['id']) {
                          flag = false;
                          prev_quest = data["new_question"]['id'];
                          counter = counter + 1;
                        }
                        data = data["new_question"];
                        return Column(
                          children: <Widget>[
                            SizedBox(
                              height: 100,
                            ),
                            _getQuestionNumber(counter),
                            SizedBox(
                              height: 40,
                            ),
                            _getQuestionText(data["question"]),
                            SizedBox(
                              height: 60,
                            ),
                            _getAnswer(context, data["a1"], data['id'], 1,
                                data["nRight"]),
                            SizedBox(
                              height: 40,
                            ),
                            _getAnswer(context, data["a2"], data['id'], 2,
                                data["nRight"]),
                            SizedBox(
                              height: 40,
                            ),
                            _getAnswer(context, data["a3"], data['id'], 3,
                                data["nRight"]),
                            SizedBox(
                              height: 40,
                            ),
                            _getAnswer(context, data["a4"], data['id'], 4,
                                data["nRight"]),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        );
                      }
                    } else {
                      return Text('error');
                    }
                  }))
        ],
      ),
    ));
  }

  _getAnswer(context, text, id, ans, rightAns) {
    var color;
    if ((flag == true) && (ans == rightAns)) {
      color = Colors.green.shade900;
    } else if (flag == true) {
      color = Colors.red.shade700;
    } else {
      color = Color.fromRGBO(216, 230, 252, 1);
    }
    return GestureDetector(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Color.fromRGBO(20, 49, 92, 1),
            radius: 15,
            child: Icon(Icons.check),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: color),
          ),
        ],
      ),
      onTap: () {
        if (ans == rightAns) {
          right_ans = right_ans + 1;
        }
        if (flag == false) {
          widget.channel.sink.add(jsonEncode({
            'action': 'answer',
            'user': '123@123.ru',
            'answer': {'id': id, 'ans': ans}
          }));
          setState(() {
            flag = true;
          });
        }
      },
    );
  }
}

_getQuestionNumber(number) {
  return Flexible(
    child: Text(
      'Вопрос №$number',
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(216, 230, 252, 1)),
    ),
  );
}

_getQuestionText(text) {
  return Container(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Text(
              text,
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
