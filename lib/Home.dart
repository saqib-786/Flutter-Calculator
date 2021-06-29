import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = '';

  clear() {
    setState(() {
      result = "";
    });
  }

  resultOutput() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  Widget inputValue(var userValue) {
    return ButtonTheme(
      minWidth: 100.0,
      height: 100.0,
      child: RaisedButton(
        onPressed: () {
          setState(() {
            result = result + userValue;
          });
        },
        child: Text(
          userValue,
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                result,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                    fontWeight: FontWeight.bold),
              ),
            ),
            width: 450,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(),
              color: Color(0xff2092EC),
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                inputValue('7'),
                inputValue('8'),
                inputValue('9'),
                inputValue('X')
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                inputValue('4'),
                inputValue('5'),
                inputValue('6'),
                inputValue('-')
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                inputValue('1'),
                inputValue('2'),
                inputValue('3'),
                inputValue('+')
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonTheme(
                    minWidth: 100.0,
                    height: 100.0,
                    child: RaisedButton(
                      onPressed: clear,
                      child: Text(
                        'C',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                inputValue('0'),
                ButtonTheme(
                    minWidth: 100.0,
                    height: 100.0,
                    child: RaisedButton(
                      onPressed: resultOutput,
                      child: Text(
                        '=',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                inputValue('/')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
