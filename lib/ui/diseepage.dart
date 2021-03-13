import 'dart:math';

import 'package:flutter/material.dart';

class DiseePage extends StatefulWidget {
  @override
  _DiseePageState createState() => _DiseePageState();
}

class _DiseePageState extends State<DiseePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                child: Image.asset('img/dice$leftDiceNumber.png'),
                onPressed: _randomLeftDice,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                child: Image.asset('img/dice$rightDiceNumber.png'),
                onPressed: _randomRightDice,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _randomLeftDice() {
    setState(() {
      leftDiceNumber = _randomNumber();
    });
  }

  void _randomRightDice() {
    setState(() {
      rightDiceNumber = _randomNumber();
    });
  }

  int _randomNumber() {
    return Random().nextInt(6) + 1;
  }
}
