import 'package:flutter/cupertino.dart';

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
      "$optName${(optprice != 0) ? '($optprice円)' : ''}",
      style: const TextStyle(
          fontSize: 15.0,
          color: CupertinoColors.systemGrey
      ),
    );
  }
}
