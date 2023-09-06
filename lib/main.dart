import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'component/item_counter.dart';
import 'component/item_name.dart';
import 'component/option_name.dart';
import 'component/subtotal.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

  static const List<String> _foodImgPathList = [
    "images/food_karaage_cup.png",
    "images/fastfood_potato.png",
    "images/takoyaki_fune.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // これで両端に寄せる
              children: [
                //左寄り
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr, //L→R 指定しないとツールでエラー
                  children: [
                    //1行目
                    ItemName(index: index),
                    //2行目以降
                    if (index % 3 != 0) OptionName(index: index),
                    if (index % 2 != 0) OptionName(index: index+1),
                    if (index % 5 != 0) OptionName(index: index+2),
                    OptionName(index: index+3),
                    //カウンタ
                    ItemCounter(index: index)


                  ],
                ),
                //右寄り
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end, //center
                  textDirection: TextDirection.ltr,
                  children: [
                    Image.asset(_foodImgPathList[index%3], height: 80, width: 80,),
                    const Subtotal()
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
