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
        title: const Text(
          '詳細',
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
                    ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white, //背景色
                                side: const BorderSide(
                                  color: Colors.black, //色
                                  width: 1, //太さ
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('レジに進む', style: TextStyle(color: Colors.black)),
                        ),
                        SizedBox(width: 30),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.yellow, //背景色
                              side: const BorderSide(
                                color: Colors.black, //色
                                width: 1, //太さ
                              ),
                            ),
                            onPressed: () {

                            },
                            child: Text('カートに追加',style: TextStyle(color: Colors.black)),
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
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('閉じる'),
          ),
        ],
      );
    },
  );
}
