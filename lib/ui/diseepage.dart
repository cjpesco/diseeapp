import 'dart:math';

import 'package:flutter/material.dart';

class DiseePage extends StatefulWidget {
  @override
  _DiseePageState createState() => _DiseePageState();
}

class _DiseePageState extends State<DiseePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  List leftDiceRolls = [0, 0, 0, 0, 0];
  List rightDiceRolls = [0, 0, 0, 0, 0];
  int leftDiceCounter = 0;
  int rightDiceCounter = 0;

  String winner = 'Roll your dice now!';
  String titleWinner = 'FIVE FATES';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: Text('$titleWinner',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          onPressed: _resetRollDice,
        ),
        SizedBox(
          height: 30,
        ),
        Text('$winner',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        Row(
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
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Player 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Player 2',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '${leftDiceRolls[0]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '${rightDiceRolls[0]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '${leftDiceRolls[1]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '${rightDiceRolls[1]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '${leftDiceRolls[2]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '${rightDiceRolls[2]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '${leftDiceRolls[3]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '${rightDiceRolls[3]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '${leftDiceRolls[4]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '${rightDiceRolls[4]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _randomLeftDice() {
    setState(() {
      leftDiceNumber = _randomNumber();

      if (leftDiceCounter < leftDiceRolls.length) {
        leftDiceRolls[leftDiceCounter] = leftDiceNumber;
        leftDiceCounter++;
        if (leftDiceCounter == leftDiceRolls.length) {
          _settleScore();
        }
      }
    });
  }

  void _randomRightDice() {
    setState(() {
      rightDiceNumber = _randomNumber();
      if (rightDiceCounter < rightDiceRolls.length) {
        rightDiceRolls[rightDiceCounter] = rightDiceNumber;
        rightDiceCounter++;
        if (rightDiceCounter == rightDiceRolls.length) {
          _settleScore();
        }
      }
    });
  }

  int _randomNumber() {
    return Random().nextInt(6) + 1;
  }

  void _settleScore() {
    if (leftDiceCounter == rightDiceCounter) {
      int totalLeftRolls = 0;
      int totalRightRolls = 0;
      for (int i = 0; i < leftDiceCounter; i++) {
        totalLeftRolls += leftDiceRolls[i];
      }
      for (int i = 0; i < rightDiceCounter; i++) {
        totalRightRolls += rightDiceRolls[i];
      }

      if (totalLeftRolls > totalRightRolls) {
        winner = 'Player 1 Wins!';
      } else if (totalLeftRolls == totalRightRolls) {
        winner = 'Draw';
      } else {
        winner = 'Player 2 Wins!';
      }
      titleWinner = 'Restart Game';
      debugPrint('Total Left Dice Rolls: $totalLeftRolls');
      debugPrint('Total Left Dice Rolls: $totalRightRolls');
    }
  }

  void _resetRollDice() {
    setState(() {
      leftDiceNumber = 1;
      rightDiceNumber = 1;
      leftDiceRolls = [0, 0, 0, 0, 0];
      rightDiceRolls = [0, 0, 0, 0, 0];
      leftDiceCounter = 0;
      rightDiceCounter = 0;
      winner = 'Roll your dice now!';
      titleWinner = 'FIVE FATES';
    });
  }
}
