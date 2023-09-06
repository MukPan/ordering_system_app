import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Subtotal extends StatelessWidget {
  const Subtotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${math.Random().nextInt(150) * 10}円",
      style: const TextStyle(
          fontSize: 15.0,
      ),
    );
  }
}
