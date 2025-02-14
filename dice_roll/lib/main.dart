import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(const DiceRollMain());
}
// MaterialApp Widget
class DiceRollMain extends StatelessWidget {
  const DiceRollMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceRoll(),
    );
  }
}
// End MaterialApp

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  int diceOne = 1;
  int diceTwo = 1;
  int diceTotal = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Roll",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: TextButton(
          onPressed: () => setState(() {
          // Random.NextInt(n) returns a random value between 0 and n-1
            diceOne = Random().nextInt(6) + 1;
            diceTwo = Random().nextInt(6) + 1;
            diceTotal = diceOne + diceTwo;
          }),
          child: Column(
            children: [
              Image.asset("images/dice-$diceOne.png", width: 200, height: 200),
              Image.asset("images/dice-$diceTwo.png", width: 200, height: 200),
              Text("You rolled: $diceTotal", style: 
                TextStyle(
                  color: Colors.black, 
                  fontSize: 30,
                )
              ),
            ]
          ),
        ),
      ),
    );
  }
}