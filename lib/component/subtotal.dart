import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/item_count_family.dart';

class Subtotal extends HookConsumerWidget {
  Subtotal({Key? key, required this.index}) : super(key: key);

  ///列番号
  final int index;

  ///値段
  final int amount = math.Random().nextInt(150) * 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //個数
    final int count = ref.watch(itemCountFamily(index));


    return Text(
      "${amount * count}円",
      style: const TextStyle(
          fontSize: 15.0,
      ),
    );
  }
}
