import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

  @override
  Widget build(BuildContext context) {
    List<String> itemList = [
      "唐揚げ",
      "ポテト",
      "たこ焼き",
    ];

    List<String> optionList = [
      "マヨネーズ",
      "ケチャップ",
      "ケチャップ&マヨネーズ",
      "塩",
      "焼きチーズ",
      "ソース",
      "青のり",
    ];

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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr, //L→R 指定しないとツールでエラー
                  children: [
                    //左寄り
                    Text(
                      itemList[index % 3],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0
                      ),
                    ),

                    //右寄り
                    if (index % 3 != 0) Text(
                      optionList[index % 7],
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: CupertinoColors.systemGrey
                      ),
                    ),
                    if (index % 2 != 0) Text(
                      optionList[(index+1) % 7],
                      style: const TextStyle(
                          fontSize: 15.0,
                          color: CupertinoColors.systemGrey
                      ),
                    ),
                    if (index % 5 != 0) Text(
                      optionList[(index+2) % 7],
                      style: const TextStyle(
                          fontSize: 15.0,
                          color: CupertinoColors.systemGrey
                      ),
                    ),
                    Text(
                      optionList[(index+3) % 7],
                      style: const TextStyle(
                          fontSize: 15.0,
                          color: CupertinoColors.systemGrey
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () { print("nu"); },
                  icon: const Icon(Icons.refresh)
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
