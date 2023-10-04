import 'package:cash_register_app/object/item_obj.dart';
import 'package:cash_register_app/provider/cart_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final db2 = FirebaseDatabase.instance;

class SendOrderBtn extends HookConsumerWidget {
  const SendOrderBtn({Key? key}) : super(key: key);

  void sendOrderList(WidgetRef ref) async {
    //現在の注文番号一覧を取得し、最新番号を特定
    final orderNumsLogListEvent = await db2.ref("orderNumsLogArr").once();
    final List<int> orderNumsLogList = (orderNumsLogListEvent.snapshot.value as List<dynamic>) //TODO:0個のとき確認する
      .map((orderNumsDyn) => orderNumsDyn as int)
      .toList();
    //TODO:分岐で注文番号1を生成
    //新しい注文番号を作成
    final newOrderNum = orderNumsLogList[orderNumsLogList.length-1] + 1;
    //プロバイダーからカートリストを取得
    List<ItemObj> cartList = ref.read(cartListProvider);
    //json形式に直す()
    final cartListJson = {
      newOrderNum: {
        "orderList": {},
        "orderStatus": "temp",
        "timestamp": 0,
      }
    };
    //注文内容が入っていないjson形式をdbに送信
    for (final itemObj in cartList) {
      db2.ref("orderNums/$newOrderNum/orderList/")
        .push() //新しいuuidを作成
        .set({
          "item": itemObj.itemName,
          "options": itemObj.optList
              .map((optObj) => optObj.optName)
              .toList(),
          "qty": itemObj.qty
        });
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
        onPressed: () {
          sendOrderList(ref);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
        ),
        child: const Text(
          "注文を確定する",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        )
    );
  }
}
