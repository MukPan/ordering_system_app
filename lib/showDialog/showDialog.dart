import 'package:flutter/material.dart';
import 'bottom.dart';
import 'count.dart';

void showCustomDialog(BuildContext context) {
  int counter = 0;
  List<String> items = [
    'チーズ',
    'ケチャップ',
    'ケチャップ',
    'チーズ',
    'ケチャップ',
    'ケチャップ',
  ];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontSize: 30,
        ),
        contentTextStyle: const TextStyle(
          fontSize: 20,
        ),
        titlePadding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
        contentPadding: const EdgeInsets.fromLTRB(40, 20, 40, 30),
        actionsPadding: const EdgeInsets.fromLTRB(40, 0, 40, 30),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        title: const Text(
          '詳細', //TODO: ここを商品名にする
          style: TextStyle(color: Colors.black),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'images/fastfood_potato.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'トッピング',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: 400,
              height: 200,
              color: Colors.transparent,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Card(
                        child: ListTile(title: Text(items[index])),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: NotificationButton(),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.black,
              indent: 0,
              endIndent: 0,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      '個数:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      child: Cuntpage(),
                    ),
                  ],
                ),
               Center(
                 child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        const SizedBox(width: 17.7),
                        SizedBox(width: 30),
                    Center(
                      child: SizedBox(
                        width: 200, //横幅
                        height: 50, //高さ
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.yellow, //背景色
                              side: const BorderSide(
                                color: Colors.black, //色
                                width: 1, //太さ
                              ),
                            ),
                            onPressed: () {

                              // amount = counter

                            },
                            child: Text('カートに追加',style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                      ],
                    ),
                  ),
                ),
               ),
              ],
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: const BorderSide(color: Colors.grey),
              foregroundColor: Colors.grey.withAlpha(10), //ボタンを押下時のエフェクト色と文字色(子要素で上書き可能)
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),

            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('閉じる', style: TextStyle(color: Colors.black)),
          ),
        ],
      );
    },
  );
}
