import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultCircularProgressIndicator extends StatelessWidget {
  const DefaultCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Center(
    child: SizedBox(
      height: 100.h,
      width: 100.w,
      child: const CircularProgressIndicator(
        color: Colors.black,
        strokeWidth: 10
      ),
    ),
  );
    }
}
