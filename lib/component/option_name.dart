import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../object/opt_obj.dart';

class OptionName extends StatelessWidget {
  const OptionName({Key? key, required this.optObj}) : super(key: key);

  ///オプションObj
  final OptObj optObj;

  @override
  Widget build(BuildContext context) {
    final optName = optObj.optName;
    final optprice = optObj.optPrice;
    return Text(
      "$optName${(optprice != 0) ? '(${NumberFormat("#,###").format(optprice)}円)' : ''}",
      style: TextStyle(
          fontSize: 15.sp,
          color: CupertinoColors.systemGrey
      ),
    );
  }
}
