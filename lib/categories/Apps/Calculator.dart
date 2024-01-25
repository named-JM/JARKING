import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _expression = '';
  String _result = '';
  String _savedResult = '';

  void _updateExpression(String value) {
    setState(() {
      _expression += value;
    });
  }

  void _clear() {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  void _calculateResult() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      double evalResult = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        _result = evalResult.toString();
        _savedResult = _result;

        // Update expression with the result if the user taps another operation
        if (_expression.isNotEmpty && _expression != _result) {
          _expression = _result;
        }
      });
    } catch (e) {
      setState(() {
        _result = 'Error';
      });
    }
  }

  void _deleteLastCharacter() {
    setState(() {
      if (_expression.isNotEmpty) {
        _expression = _expression.substring(0, _expression.length - 1);
      }
    });
  }

  Widget _buildButton(String buttonText) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: Colors.white, // Change color as needed
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(3, 3),
                  blurRadius: 5
                  //spreadRadius: 1,
                  ),
              // Top left shadow is lighter
              BoxShadow(
                color: Colors.white,
                offset: Offset(-3, -3),
                blurRadius: 5,
                //spreadRadius: 1,
              ),
            ]),
        child: ElevatedButton(
          onPressed: () {
            if (buttonText == '⌫') {
              _deleteLastCharacter();
            } else if (buttonText == '=') {
              _calculateResult();
            } else if (buttonText == 'C') {
              _clear();
            } else {
              _updateExpression(buttonText);
            }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            padding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black), // Change text color as needed
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return _buildButton('⌫');
  }

  Widget _buildClearButton() {
    return _buildButton('C');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //--BORDER INPUT NUMBERS DISPLAY
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.transparent, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500, // Inner shadow color
                    offset: Offset(-4, -4), // Move shadow up and left
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.grey.shade200, // Inner shadow color
                    offset: Offset(1, 1), // Move shadow up and left
                    //blurRadius: 0,
                  ),
                ],
              ),
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  Text(
                    _expression,
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    _result,
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            //====BUTTONS
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDeleteButton(),
                _buildClearButton(),
                _buildButton('='),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('+'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('*'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('.'),
                _buildButton('0'),
                _buildButton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
