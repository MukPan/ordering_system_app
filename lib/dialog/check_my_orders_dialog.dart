
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../cart/cart.dart';
import '../context/item_list.dart';
import '../object/item_obj.dart';
import '../provider/cart_provider.dart';

///下から注文内容を出すダイアログ
void showCheckMyOrdersDialog(context, WidgetRef ref) {

  showModalBottomSheet(
    //モーダルの背景の色、透過
      backgroundColor: Colors.transparent,
      isScrollControlled: true, //ドラッグ可能にする
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height * (5/6),
            decoration: const BoxDecoration(
              //モーダル自体の色
              color: Colors.white,
              //角丸にする
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                //バー
                Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                //注文リスト
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const ItemList(),
                  ),
                )
              ],
            )
          );
        }
      );
}