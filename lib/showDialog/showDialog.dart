import 'package:cash_register_app/object/item_obj.dart';
import 'package:cash_register_app/provider/cart_provider.dart';
import 'package:cash_register_app/showDialog/sub_total.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../database/Individual items.dart';
import '../database/item_infos.dart';
import '../image/image_asset.dart';
import '../object/opt_obj.dart';
import '../provider/amount_per_item.dart';
import '../provider/countprovider.dart';
import '../provider/opt_is_enabled.dart';
import 'bottom.dart';
import 'count.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

import '../cart/cart.dart';


void showCustomDialog(BuildContext context, WidgetRef ref,ItemInfo iteminfo) {

  for (final optName in iteminfo.optInfoList.map((optInfo) => optInfo.optName)) {
    ref.read(optIsEnabledFamily(optName).notifier).state = false;
  }
  ref.read(counterProvider.notifier).state = 1;

  final int itemPrice = iteminfo.itemPrice;

  final int optsPrice = (!iteminfo.optInfoList.isNotEmpty)
      ? iteminfo.optInfoList
      .map((optinfo) => optinfo.optPrice)
      .reduce((sum, price) => sum + price)
      : 0;
  final int amountPerItem = itemPrice + optsPrice;

  ref.read(amountPerItemProvider.notifier).state = amountPerItem;

  final String item_name = iteminfo.itemName;

  // final amount_per = ref.watch(amountPerItemProvider);
  // final counter = ref.watch(counterProvider);

  // final sub_total = amount_per * counter;

  showDialog(
    context: context,
    builder: (BuildContext context) {

      final amount_per = ref.watch(amountPerItemProvider);
      final counter = ref.watch(counterProvider);
      final sub_total = amount_per * counter;
      final String item_name = iteminfo.itemName;

      print(item_name);

      return AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontSize: 30,
        ),
        contentTextStyle: const TextStyle(
          fontSize: 20,
        ),
        titlePadding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        contentPadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        //商品名
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //商品名
            Text(item_name),
            //バツボタン
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(CupertinoIcons.xmark),
              ),
            )
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              // padding: EdgeInsets.,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ItemImg(itemName: item_name, size: 120),
            ),
            // Container(
            //   width: 300,
            //   height: 200,
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.grey),
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(20),
            //     //商品画像
            //     child: ItemImg(itemName: item_name)
            //   ),
            // ),
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
                itemCount:iteminfo.optInfoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Card(
                        child: OptionTile(optInfo: iteminfo.optInfoList[index]),
                        // child: ListTile(title: Text(karaageOptions[index].optName)),
                      ),
                      // Align(
                        // alignment: Alignment.centerRight,
                        // child: OptionTile(optInfo: karaageOptions[index]),

                        // child: OptionTile(optInfo: karaageOptions[index])
                      // ),
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
                      child:CounterWidget(),
                    ),
                     Text(
                      '小計：'
                    ),
                    Container(
                      child: SubTotalWidget(),
                    )
                  ],
                ),
                Center(
                  child: SizedBox(
                    width: 200, //横幅
                    height: 50, //高さ
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, //背景色
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        final cartListController = ref.watch(cartListProvider);

                        final cartService = CartListService(cartListController);

                        cartService.addItemToCart(context, ref,iteminfo);
                        // CartModel();
                        Navigator.of(context).pop();
                      },
                      child: const Text('カートに追加',style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
