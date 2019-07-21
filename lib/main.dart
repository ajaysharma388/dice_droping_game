import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text(
            'Dicee Droping Game',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  static var rnd = new Random();
  int attempt = 50;
  int leftDice = rnd.nextInt(6) + 1;
  int rightDice = rnd.nextInt(6) + 1;
  @override
  Widget build(BuildContext context) {
//    int leftDice = rnd.nextInt(6) + 1;
//    int rightDice = rnd.nextInt(6) + 1;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/images/dice$leftDice.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/images/dice$rightDice.png'),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: RaisedButton(
            color: Colors.white,
            onPressed: () {
              setState(() {
                leftDice = rnd.nextInt(6) + 1;
                rightDice = rnd.nextInt(6) + 1;
                attempt = attempt - 1;
                if (leftDice == 6 && rightDice == 6)
                  winContest(context);
                else if (attempt == 0) loseContest(context);
              });
            },
            elevation: 6,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'PLAY WITH DICE',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 20,
                  color: Colors.red,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          child: SizedBox(
            height: 100,
            width: 100,
            child: Center(
              child: Text(
                '$attempt',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 20,
                  color: Colors.red,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void winContest(BuildContext context) async {
    var alertDailog = AlertDialog(
      title: Text(
        "Congrat's You Won",
        style: TextStyle(
          fontFamily: 'Muli',
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        'You are Definately a Champian Man You Did Well.',
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Pacifico',
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Restart'),
          onPressed: () {
            setState(() {
              leftDice = rnd.nextInt(6) + 1;
              rightDice = rnd.nextInt(6) + 1;
              attempt = 50;
              Navigator.of(context).pop();
            });
          },
        ),
      ],
    );
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) => alertDailog);
  }

  void loseContest(BuildContext context) async {
    var alertDailog = AlertDialog(
      title: Text(
        "OOP's It Did't Work Out",
        style: TextStyle(
          fontFamily: 'Muli',
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        'You can definately be a champian man you just need to try harder!',
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Pacifico',
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Restart'),
          onPressed: () {
            setState(() {
              leftDice = rnd.nextInt(6) + 1;
              rightDice = rnd.nextInt(6) + 1;
              attempt = 50;
              Navigator.of(context).pop();
            });
          },
        ),
      ],
    );
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return alertDailog;
      },
    );
  }
}
