import 'package:cash_register_app/image/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../cart/cart.dart';
import '../component/item_name.dart';
import '../component/option_name.dart';
import '../component/subtotal.dart';
import '../dialog/edit_order_dialog.dart';
import '../object/item_obj.dart';
import '../object/opt_obj.dart';
import '../provider/cart_provider.dart';

class ItemList extends HookConsumerWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartListController = ref.watch(cartListProvider);
    final cartService = CartListService(cartListController);
    //かごに入っているリストを取得
    final List<ItemObj> cartList = cartService.getCartList();

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: cartList.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        //一つの商品を配列から取り出す
        final ItemObj itemObj = cartList[index];
        final String itemName = itemObj.itemName;
        final int itemPrice = itemObj.itemPrice;
        final int qty = itemObj.qty;
        final int subtotal = itemObj.getSubtotal();
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
                    Row(
                      children: [
                        ItemName(itemName: itemName),
                        IconButton( //編集ダイアログを表示
                            onPressed: () {
                              showEditOrderDialog(
                                context: context,
                                ref: ref,
                                cartList: cartList, ///カートリスト
                                cartIndex: index, ///編集中のindex
                              );
                            },
                            icon: const Icon(Icons.edit)
                        ) //編集ボタン
                      ],
                    ),
                    //2行目以降
                    (optList.isNotEmpty) ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: optList.length,
                      itemBuilder: (context, index) {
                        print(index);
                        final OptObj optObj = optList[index];
                        return OptionName(optObj: optObj);
                      },
                    ) : Container(),

                    //カウンタ
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text("個数 : $qty", style: TextStyle(fontSize: 15.sp),),
                    ),
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
                    Subtotal(subtotal: subtotal)
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
