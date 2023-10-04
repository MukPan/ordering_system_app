import 'package:cash_register_app/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../cart/cart.dart';
import '../object/item_obj.dart';

// // リストの初期値を提供するProvider
// final CartProvider = Provider<List<String>>((ref) {
//   return cart = []; // 初期データをここで設定
// });
//
// // リストの内容を変更するためのStateProvider
// final CartlistStateProvider = StateProvider<List<String>>((ref) {
//   return ref.watch(CartProvider); // 初期状態はlistProviderから取得
// });

final cartListProvider = StateProvider<List<ItemObj>>((ref) {
  return [];
});
