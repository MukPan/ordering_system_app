import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/item_count_family.dart';

class Subtotal extends HookConsumerWidget {
  Subtotal({Key? key, required this.subtotal}) : super(key: key);

  //小計
  final int subtotal;

  ///値段
  final int amount = math.Random().nextInt(150) * 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10),
      child: Text(
        "$subtotal円",
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
