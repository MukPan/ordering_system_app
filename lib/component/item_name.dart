import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemName extends StatelessWidget {
  const ItemName({Key? key, required this.itemName}) : super(key: key);

  ///商品名
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Text(
      itemName,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
          height: 1
      ),
    );
  }
}
