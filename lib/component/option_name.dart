import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionName extends StatelessWidget {
  const OptionName({Key? key, required this.index}) : super(key: key);

  final int index;

  static const List<String> _optionList = [
    "マヨネーズ",
    "ケチャップ",
    "ケチャップ&マヨネーズ",
    "塩",
    "焼きチーズ",
    "ソース",
    "青のり",
  ];


  @override
  Widget build(BuildContext context) {
    return Text(
      _optionList[index % 3],
      style: const TextStyle(
          fontSize: 15.0,
          color: CupertinoColors.systemGrey
      ),
    );
  }
}
