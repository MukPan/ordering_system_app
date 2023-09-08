import 'package:cash_register_app/component/default_app_bar.dart';
import 'package:flutter/material.dart';

import '../context/item_list.dart';
import '../context/total_bar.dart';

class ConfirmOrderingPage extends StatelessWidget {
  const ConfirmOrderingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: DefaultAppBar(title: "注文内容の確認"),
        body: Column( //Stack
          children: [
            ItemList(), //項目リスト
            TotalBar() //合計金額表示バー
          ],
        )
    );
  }
}
