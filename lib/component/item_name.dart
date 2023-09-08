import 'package:flutter/material.dart';

class ItemName extends StatelessWidget {
  const ItemName({Key? key, required this.index}) : super(key: key);

  final int index;

  static const List<String> _itemList = [
    "唐揚げ",
    "ポテト",
    "たこ焼き",
  ];


  @override
  Widget build(BuildContext context) {
    return Text(
      _itemList[index % 3],
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0
      ),
    );
  }
}
