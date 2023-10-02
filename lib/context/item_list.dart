import 'package:flutter/material.dart';

import '../component/item_counter.dart';
import '../component/item_name.dart';
import '../component/option_name.dart';
import '../component/subtotal.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  //TODO: リスト行数をプロバイダーで供給する
  ///リスト行数
  static const int itemListlinesCount = 10;

  ///imgのパスリスト
  static const List<String> _foodImgPathList = [
    "images/food_karaage_cup.png",
    "images/fastfood_potato.png",
    "images/takoyaki_fune.png",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: itemListlinesCount,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                  //商品画像
                  Image.asset(_foodImgPathList[index%3], height: 80, width: 80, ),
                  //小計
                  Subtotal(index: index)
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
