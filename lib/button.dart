import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  const Button(this.color);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 70,
      width: 150,
      color: this.color,
      padding: EdgeInsets.all(6),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'click',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}