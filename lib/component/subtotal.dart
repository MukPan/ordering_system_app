import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';


class Subtotal extends HookConsumerWidget {
  Subtotal({Key? key, required this.subtotal}) : super(key: key);

  //小計
  final int subtotal;




  ///値段
  final int amount = math.Random().nextInt(150) * 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('デバック:${subtotal}');

    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10),
      child: Text(
        "${NumberFormat("#,###").format(subtotal)}円",
        style: TextStyle(
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
