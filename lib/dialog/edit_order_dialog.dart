import 'package:cash_register_app/object/item_obj.dart';
import 'package:cash_register_app/provider/cart_provider.dart';
import 'package:cash_register_app/showDialog/sub_total.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../database/item_infos.dart';
import '../image/image_asset.dart';
import '../provider/amount_per_item.dart';
import '../provider/countprovider.dart';
import '../provider/opt_is_enabled.dart';

import '../cart/cart.dart';
import '../showDialog/bottom.dart';
import '../showDialog/count.dart';
import 'edit_buttom.dart';

//cartList
//cartIndex: カートリストのどの部分を編集しているのか特定するために必要
void showEditOrderDialog({ //itemInfo, context, ref
  required context,
  required WidgetRef ref,
  required List<ItemObj> cartList, ///カートリスト
  required int cartIndex, ///編集中のindex
}) {

  //編集中の商品インフォを取得
  final targetItemObj = cartList[cartIndex];
  final targetItemName = targetItemObj.itemName;

  final iteminfo = itemInfos.getList()
    .where((itemInfo) => itemInfo.itemName == targetItemName) //名前で絞り込み
    .first;

  final String itemName = iteminfo.itemName;

  //ありなし初期化
  for (final optName in iteminfo.optInfoList.map((optInfo) => optInfo.optName)) {
    ref.read(optIsEnabledFamily(optName).notifier).state = false;
  }
  //元のありなしを反映
  for (final optName in targetItemObj.optList.map((optInfo) => optInfo.optName)) {
    ref.read(optIsEnabledFamily(optName).notifier).state = true;
  }
  //元のカウントを反映
  ref.read(counterProvider.notifier).state = targetItemObj.qty;

  final int itemPrice = iteminfo.itemPrice;

  if (iteminfo.category == "drink") {
    final int optsPrice =
    (iteminfo.optInfoList.isNotEmpty) //ドリンクはオプションが無いので!を消す

        ? iteminfo.optInfoList
        .map((optinfo) => optinfo.optPrice)
        .reduce((sum, price) => sum + price)
        : 0;
    final int amountPerItem = itemPrice + optsPrice;
    ref.read(amountPerItemProvider.notifier).state = amountPerItem;
  } else {
    final int optsPrice =
    (!iteminfo.optInfoList.isNotEmpty) //!を入れることでオプションの有無しを正確な値にしている
        ? iteminfo.optInfoList
        .map((optinfo) => optinfo.optPrice)
        .reduce((sum, price) => sum + price)
        : 0;
    final int amountPerItem = itemPrice + optsPrice;
  ref.read(amountPerItemProvider.notifier).state = amountPerItem;}

  //画面サイズ取得
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  print('ada${screenHeight}');
  print('dadqw${screenWidth}');

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 30.sp,
        ),
        contentTextStyle: TextStyle(
          fontSize: 20.sp,
        ),
        titlePadding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        //商品名
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //商品名
                Text(
                  itemName,
                  style: TextStyle(fontSize: 20.sp),
                ),
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
            SizedBox(
              width: screenWidth.w, //7割のサイズ
              height: (screenHeight * 0.6).h,
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            // padding: EdgeInsets.,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ItemImg(itemName: itemName, size: 120),
                          ),
                          //見出し
                          (iteminfo.optInfoList.isNotEmpty)
                              ? Container(
                            width: double.infinity,
                            margin:
                            const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'トッピング',
                              style: TextStyle(
                                  fontSize: 20.sp, color: Colors.grey),
                            ),
                          )
                              : Container(),
                          //オプション一覧 iteminfo.optInfoList.length
                          (iteminfo.optInfoList.isNotEmpty)
                              ? ListView.separated(
                            shrinkWrap: true,
                            itemCount: iteminfo.optInfoList.length,
                            separatorBuilder: (context, index) =>
                            const Divider(),
                            itemBuilder: (BuildContext context, int index) {
                              return OptionTile(
                                  optInfo: iteminfo.optInfoList[index]);
                            },
                          )
                              : const SizedBox(height: 10),
                          const Divider(
                            color: Colors.black,
                          ), //インデント?
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            ),
  Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //カウンター
                    CounterWidget(displayTrashBtn: true, cartIndex: cartIndex),
                    //小計
                    const SubTotalWidget()
                  ],
                ),
              ),

              //カートに追加ボタン
              Center(
                child: SizedBox(
                  width: 200.w, //横幅
                  height: 50.h, //高さ
                  child: EditButtom (
                    onPressed: () {
                    final cartListController = ref.watch(cartListProvider);
                    final cartService = CartListService(cartListController);
                    cartService.updateItemToCart(context, ref, iteminfo,cartIndex);
                    Navigator.of(context).pop();
                  },
                  ),
                  ),
                )
            ],
          ),
      );
    },
  );
}
//   //画面サイズ取得
//   final screenWidth = MediaQuery.of(context).size.width;
//   final screenHeight = MediaQuery.of(context).size.height;
//
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//
//       final amountPer = ref.watch(amountPerItemProvider);
//       final counter = ref.watch(counterProvider);
//       final subTotal = amountPer * counter;
//       final String itemName = iteminfo.itemName;
//
//       print(amountPer);
//
//       print(itemName);
//
//       return AlertDialog(
//         backgroundColor: Colors.white,
//         surfaceTintColor: Colors.white,
//         titleTextStyle: TextStyle(
//           fontSize: 30.sp,
//         ),
//         contentTextStyle: TextStyle(
//           fontSize: 20.sp,
//         ),
//         titlePadding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
//         contentPadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0))
//         ),
//         //商品名
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             //商品名
//             Text(itemName, style: TextStyle(fontSize: 20.sp),),
//             //バツボタン
//             Container(
//               margin: const EdgeInsets.only(top: 5),
//               child: IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 icon: const Icon(CupertinoIcons.xmark),
//               ),
//             )
//           ],
//         ),
//         content: SizedBox(
//           width: (screenWidth * 0.7).w, //7割のサイズ
//           height: (iteminfo.optInfoList.isNotEmpty)
//               ? (screenHeight * 0.75).h  //7.5割のサイズ
//               : null,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(15),
//                 // padding: EdgeInsets.,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: ItemImg(itemName: itemName, size: 120),
//               ),
//               //見出し
//               (iteminfo.optInfoList.isNotEmpty)
//                 ? Container(
//                   width: double.infinity,
//                   margin: const EdgeInsets.symmetric(vertical: 15),
//                   child: Text(
//                     'トッピング',
//                     style: TextStyle(fontSize: 15.sp, color: Colors.grey),
//                   ),
//               ) : Container(),
//               //オプション一覧 iteminfo.optInfoList.length
//               (iteminfo.optInfoList.isNotEmpty)
//                 ? Expanded(
//                   child:ListView.separated(
//                     shrinkWrap: true,
//                     itemCount: iteminfo.optInfoList.length,
//                     separatorBuilder: (context, index) => const Divider(),
//                     itemBuilder: (BuildContext context, int index) {
//                       return OptionTile(optInfo: iteminfo.optInfoList[index]);
//                     },
//                 ),
//               ) : const SizedBox(height: 10),
//               const Divider(color: Colors.black,), //インデント?
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     //カウンター
//                     CounterWidget(displayTrashBtn: true, cartIndex: cartIndex),
//                     //小計
//                     const SubTotalWidget()
//                   ],
//                 ),
//               ),
//
//               //カートに追加ボタン
//               Center(
//                 child: SizedBox(
//                   width: 200.w, //横幅
//                   height: 50.h, //高さ
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.orange, //背景色
//                       foregroundColor: Colors.white,
//                     ),
//                     onPressed: () {
//                       final cartListController = ref.watch(cartListProvider);
//                       final cartService = CartListService(cartListController);
//                       cartService.updateItemToCart(context, ref, iteminfo, cartIndex);
//                       Navigator.of(context).pop();
//                     },
//                     child: Text('注文を更新', style: TextStyle(color: Colors.white, fontSize: 15.sp)),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
