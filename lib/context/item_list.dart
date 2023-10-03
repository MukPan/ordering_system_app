import 'package:cash_register_app/image/image_asset.dart';
import 'package:flutter/material.dart';

import '../component/item_counter.dart';
import '../component/item_name.dart';
import '../component/option_name.dart';
import '../component/subtotal.dart';
import '../object/item_obj.dart';
import '../object/opt_obj.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key, required this.cartList}) : super(key: key);

  final List<ItemObj> cartList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: cartList.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        //一つの商品を配列から取り出す
        final ItemObj itemObj = cartList[index];
        final String itemName = itemObj.itemName;
        final int itemPrice = itemObj.itemPrice;
        final List<OptObj> optList = itemObj.optList;

        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // これで両端に寄せる
            children: [
              //左寄り
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr, //L→R 指定しないとツールでエラー
                  children: [
                    //1行目
                    ItemName(itemName: itemName),
                    //2行目以降
                    (optList.isNotEmpty) ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: optList.length,
                      itemBuilder: (context, index) {
                        final OptObj optObj = optList[index];
                        return OptionName(optObj: optObj);
                      },
                    ) : Container(),

                    //カウンタ
                    ItemCounter(index: index)
                  ],
                ),
              ),
              //右寄り
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end, //center
                  textDirection: TextDirection.ltr,
                  children: [
                    //商品画像
                    ItemImg(itemName: itemName),
                    //小計
                    Subtotal(index: index)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
