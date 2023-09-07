import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'component/item_counter.dart';
import 'component/item_name.dart';
import 'component/option_name.dart';
import 'component/subtotal.dart';
import 'context/item_list.dart';
import 'context/total_bar.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  runApp(const ProviderScope(child: MyApp()));
}

//TODO:ListTileに変える
//TODO: 最後までスクロール内容が表示されるようにする
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        highlightColor: Colors.white,

        useMaterial3: true,
      ),
      home: const MyHomePage(title: '注文内容の確認'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          surfaceTintColor: Colors.white, //スクロールすると紫色になるのを防ぐ
          shape: const Border(
            bottom: BorderSide(color: Colors.grey)
          ),
        ),
        body: const Column( //Stack
          children: [
            ItemList(), //項目リスト
            TotalBar() //合計金額表示バー
          ],
        )
    );
  }
}
