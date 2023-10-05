import 'package:cash_register_app/provider/total_counter_provider.dart';
import 'package:cash_register_app/provider/total_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../database/item_infos.dart';
import '../provider/cart_provider.dart';

void total_counter(BuildContext context, WidgetRef ref) {

  final cartListController = ref.read(cartListProvider);
  final itemList = cartListController; // StateControllerの中身を取得
  var sub_total_counter = 0;
  var total_qtr = 0;


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
    sub_total_counter = sub_total_counter + subtotal;
    total_qtr = total_qtr + item.qty;

  }
  ref.read(totalProvider.notifier).state =0;
  ref.read(total_counterProvider.notifier).state = 0;
  ref.read(totalProvider.notifier).state = ref.read(totalProvider.notifier).state + sub_total_counter;
  ref.read(total_counterProvider.notifier).state = ref.read(total_counterProvider.notifier).state + total_qtr;
  sub_total_counter = 0;
  total_qtr = 0;
  final total = ref.watch(totalProvider);
  final total_counter = ref.watch(total_counterProvider);

  print('合計:${total}');
  print('カウント：${total_counter}');

}