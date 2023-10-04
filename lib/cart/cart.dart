import 'dart:html';

import 'package:cash_register_app/object/item_obj.dart';
import 'package:cash_register_app/provider/opt_is_enabled.dart';
import 'package:cash_register_app/provider/total_provider.dart';
import 'package:cash_register_app/showDialog/count.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../database/Individual items.dart';
import '../database/item_infos.dart';
import '../object/opt_obj.dart';
import '../provider/cart_provider.dart';
import '../provider/countprovider.dart';
import '../provider/optObj_provider.dart';
//
// void cart  (){
//
// ref.read(nantyaraProvider.notifier).state
//
// }
  /// カートのリスト




  ///Addを使わずに配列の付けたしで追加をしていく。詳しくはdiscord
  //List<int> arr = [1,2,3];
  // List<int> newArr = [...arr, 4]
  // print(newArr); //1,2,3,4

  ///スレッドを使用する
  /// カートを変更
///
///
///

//
// class Obj{
//   final counter = ref.watch(counterProvider);
//
//   cartModel._items.add(
//     ItemObj(
//       itemName: karaageInfo.itemName,
//       itemPrice: karaageInfo.itemPrice,
//       qty: counter,
//       optList: [
//         OptObj(optName: "焼きチーズ", optPrice: 100),
//         OptObj(optName: "ケチャップ", optPrice: 0),
//       ],
//     ),
//   );
  //
  // print(counter);
  // print(cartModel._items);
// }





class CartListService  {

  CartListService(this._listController);

  final StateController<List<ItemObj>> _listController;

  //リストを返すメソッド
  List<ItemObj> getCartList() {
    return _listController.state;
  }

  // リストに要素を追加するメソッド
  void addItem(List<ItemObj> itemList, ItemObj newItem) {
    itemList.add(newItem);
    _listController.state = itemList;
  }

  ///リストの要素を上書きするメソッド
  ///配列番号を指定して書き換える位置を特定する
  void updateItem(List<ItemObj> itemList, ItemObj newItem, int index, WidgetRef ref) {
    itemList[index] = newItem;
    _listController.state = itemList;
  }

  // リストから要素を削除するメソッド
  void removeItem(ItemObj) {
    final currentList = _listController.state;
    currentList.remove(ItemObj);
    _listController.state = currentList;
  }

  void addItemToCart(BuildContext context,WidgetRef ref,ItemInfo iteminfo) {

    final optList = iteminfo.optInfoList
        .where((optInfo) => ref.read(optIsEnabledFamily(optInfo.optName)) == true )
          .map((optInfo) => OptObj(optName: optInfo.optName, optPrice: optInfo.optPrice))
              .toList();

    final optionObject = ref.watch(optionObjectProvider);

    final counter = ref.watch(counterProvider);

    final ItemObj newItem = ItemObj(
      itemName: iteminfo.itemName,
      itemPrice: iteminfo.itemPrice,
      qty: counter,
      optList:optList,
    );

    // CartListService を使用してリストにアイテムを追加
    addItem(_listController.state, newItem);

    final cartListController = ref.read(cartListProvider);
    final itemList = cartListController.state; // StateControllerの中身を取得

// リストの中身を出力
    for (int i = 0; i < itemList.length; i++) {
      final item = itemList[i];
      print('Item $i:');
      print('  itemName: ${item.itemName}');
      print('  itemPrice: ${item.itemPrice}');
      print('  qty: ${item.qty}');
      print('  optList: ');
      for (int j = 0; j < item.optList.length; j++) {
        final opt = item.optList[j];
        print('Option $j:');
        print('optName: ${opt.optName}');
        print('optPrice: ${opt.optPrice}');

      }
      final int subtotal = item.getSubtotal();
      print('小計: $subtotal');
      // print("test");
      var total = ref.watch(totalProvider);
      total = total + subtotal;

      print(total);
    }

  }
  ///配列番号と上書きするitemObjを指定してカートを上書きする
  // void updateItem(ItemObj newItemObj, int cartIndex) {
  void updateItemToCart(BuildContext context, WidgetRef ref, ItemInfo iteminfo, int cartIndex) {

    final optList = iteminfo.optInfoList
        .where((optInfo) => ref.read(optIsEnabledFamily(optInfo.optName)) == true )
        .map((optInfo) => OptObj(optName: optInfo.optName, optPrice: optInfo.optPrice))
        .toList();

    final optionObject = ref.watch(optionObjectProvider);

    final counter = ref.watch(counterProvider);

    final ItemObj newItem = ItemObj(
      itemName: iteminfo.itemName,
      itemPrice: iteminfo.itemPrice,
      qty: counter,
      optList:optList,
    );

    // CartListService を使用してリストにアイテムを更新 //TODO: refを追加
    updateItem(_listController.state, newItem, cartIndex, ref);

    final cartListController = ref.read(cartListProvider);
    final itemList = cartListController.state; // StateControllerの中身を取得

// リストの中身を出力
    for (int i = 0; i < itemList.length; i++) {
      final item = itemList[i];
      print('Item $i:');
      print('  itemName: ${item.itemName}');
      print('  itemPrice: ${item.itemPrice}');
      print('  qty: ${item.qty}');
      print('  optList: ');
      for (int j = 0; j < item.optList.length; j++) {
        final opt = item.optList[j];
        print('Option $j:');
        print('optName: ${opt.optName}');
        print('optPrice: ${opt.optPrice}');

      }
      final int subtotal = item.getSubtotal();
      print('小計: $subtotal');
      // print("test");
      var total = ref.watch(totalProvider);
      total = total + subtotal;

      print(total);
    }
  }
}






// void updateCart(WidgetRef ref) {
//   final cartState = ref.read(cartListProvider);
//   final updatedCart = [...cartState.state, 'New Item'];
//   ref.read(CartlistStateProvider.notifier).state = updatedCart;
//
//   // 消す時
//   final cartList = cartState.state.toList();
//   if (cartList.isNotEmpty) {
//     cartList.removeAt(0);
//     ref.read(CartlistStateProvider.notifier).state = cartList;
//   }
// }



// void updateCart(WidgetRef ref) {
//   final currentCart = ref.read(CartlistStateProvider);
//   final updatedCart = [...currentCart, 'New Item'];
//   ref.read(CartlistStateProvider.notifier).update(updatedCart);
//
//
//
//   //消す時
//   cart.remove(0);
//   ref.read(CartlistStateProvider.notifier).state = [...cart];
// }

  // final List<ItemObj> _items = [..._items];

  // void Add(Object item, WidgetRef ref) {
  //   final cartModel = ref.watch(cartProvider);
  //   final counter = ref.watch(counterProvider);
  //
  //   cartModel._items.add(
  //     ItemObj(
  //       itemName: karaageInfo.itemName,
  //       itemPrice: karaageInfo.itemPrice,
  //       qty: counter,
  //       optList: [
  //         OptObj(optName: "焼きチーズ", optPrice: 100),
  //         OptObj(optName: "ケチャップ", optPrice: 0),
  //       ],
  //     ),
  //   );
  //   //
  //   // print(counter);
  //   // print(cartModel._items);
  // }



  // /// 全て消す
  // void removeAll() {
  //   _items.clear();
  // }

