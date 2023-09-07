import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'component/item_counter.dart';
import 'component/item_name.dart';
import 'component/option_name.dart';
import 'component/subtotal.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
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
          surfaceTintColor: Colors.white, //スクロールすると紫色になるのを防ぐ
        ),
        body: Column( //Stack
          children: [
            Expanded( //ListViewが上位Containerに隠れるのを防ぐ
                child: ListView.separated(
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
                              Subtotal(index: index)
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
            ),

            //合計表示
            Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(
                        color: Colors.black,
                      )
                  )
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "合計 3個",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "1900円",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                        ),
                        child: const Text(
                          "注文を確定する",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )
                    ),
                  )
                ],
              ),

            )

          ],
        )
    );


    ////////////////////////////////////


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack( //Stack
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ListView.separated(
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
                        Subtotal(index: index)
                      ],
                    )
                  ],
                ),
              );
            },
          ),

          //合計表示
          Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                      color: Colors.black,
                    )
                )
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.spaceBetween,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "合計 3個",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    Text(
                      "1900円",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                      ),
                      child: const Text(
                        "注文を確定する",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                  ),
                )
              ],
            ),

          )

        ],
      )
    );
  }
}
