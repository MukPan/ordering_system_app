import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({Key? key, required this.title, this.diplayBackBtn = true}) : super(key: key);

  ///上部のページタイトル
  final String title;

  ///戻るボタンを表示するか
  final bool diplayBackBtn;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      automaticallyImplyLeading: diplayBackBtn,
      surfaceTintColor: Colors.white,
      shape: const Border(
          bottom: BorderSide(color: Colors.grey)
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60.0);
}
