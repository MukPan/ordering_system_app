import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SyskenLogo extends StatelessWidget {
  const SyskenLogo({Key? key}) : super(key: key);

  static const String _syskenLogoPath = "images/sysken_logo.png";

  @override
  Widget build(BuildContext context) {
    return Image.asset(_syskenLogoPath, height: 150.h, width: 150.w);
  }
}
