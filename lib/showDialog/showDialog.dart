import 'package:cash_register_app/object/item_obj.dart';
import 'package:cash_register_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../database/Individual items.dart';
import '../database/item_infos.dart';
import '../object/opt_obj.dart';
import '../provider/amount_per_item.dart';
import '../provider/countprovider.dart';
import '../provider/opt_is_enabled.dart';
import 'bottom.dart';
import 'count.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

import '../cart/cart.dart';


void showCustomDialog(BuildContext context, WidgetRef ref) {


  // final String itemName = itemObj.itemName; //"唐揚げ"
  // final int qty = itemObj.qty; //3(個)
  // final List<OptObj> optNameList = itemObj.optList; //["焼きチーズ", "ケチャップ"]
  // final int amountPerItem = itemObj.itemPrice;
  // final ItemInfo targetItemInfo = itemInfos.getList()
  //     .where((itemInfo) => itemInfo.itemName == itemName)
  //     .first;
  // //オプション候補
  // final targetOptInfoList = targetItemInfo.optInfoList;
  //
  // //プロバイダーを初期化(全てのオプションを無効"false")ここから重要
  // for (final optName in targetOptInfoList.map((optInfo) => optInfo.optName)) {
  //   ref.read(optIsEnabledFamily(optName).notifier).state = false;
  // }
  // //有効なオプションをプロバイダーに登録
  // for (final optName in optNameList) {
  //   ref.read(optIsEnabledFamily(optName as String).notifier).state = true;
  // }
  // //商品の個数をプロバイダーに登録
  // ref.read(counterProvider.notifier).state = qty;
  // //初期の1個あたりの商品の値段をプロバイダーに登録
  // ref.read(amountPerItemProvider.notifier).state = amountPerItem;





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
                itemCount: karaageOptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Card(
                        child: OptionTile(optInfo: karaageOptions[index]),
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
                  ],
                ),
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

                        final cartListController = ref.watch(cartListProvider);

                        final cartService = CartListService(cartListController);

                        cartService.addItemToCart(context, ref);
                        // CartModel();

                        Navigator.of(context).pop();


                      },
                      child: Text('カートに追加',style: TextStyle(color: Colors.black)),
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
