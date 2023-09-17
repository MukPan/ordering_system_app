import 'package:flutter/material.dart';

class Cuntpage extends StatefulWidget {
  @override
  _CountState createState() => _CountState();
}


class _CountState extends State<Cuntpage> {
  int counter = 1;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // UIの部分はここに書く。　
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle),
          onPressed: () {
            _decrement();
          },
        ),
      Text('$counter'),
       IconButton(
        icon: const Icon(Icons.add_circle),
        onPressed: () {
          _incrementCounter();
        },
      ),
      ],
    );
  }
}