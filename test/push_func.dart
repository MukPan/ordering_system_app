import 'dart:math';

import 'package:cash_register_app/object/item_obj.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
// TransactionResult

const orderNumsLogArr = "orderNumsLogArr";
const orderNums = "orderNums";

Future<TransactionResult> push(List<ItemObj> list) async {
  final orderNumsLoggArrRef = FirebaseDatabase.instance.ref("orderNumsLogArr");
  const stateManageNeeded = kIsWeb;
  if (!kIsWeb) {
    await orderNumsLoggArrRef.keepSynced(true);
  }

  final result = await orderNumsLoggArrRef.runTransaction((value) {
    if (kIsWeb) {
      orderNumsLoggArrRef
          .get()
          .then((forceFetch) => value = (forceFetch.value as List<dynamic>));
    }
    final currentItem = List<int>.from(value as List<dynamic>).reduce(max);
    print("start");
    final nextNum = currentItem + 1;
    final orderNumsRef = FirebaseDatabase.instance
        .ref("$orderNums/${(nextNum).toString()}");
    orderNumsRef.set({
      "orderList": [],
      "timestamp": ServerValue.timestamp,
      "orderStatus": "temp"
    });
    final ItemListRef =
    FirebaseDatabase.instance.ref("$orderNums/$nextNum/orderList");
    for (var e in list) {
      final ItemRef = ItemListRef.push();
      ItemRef.set({
        "item": e.itemName,
        "qty": e.qty,
        "options": e.optList.map((e) => e.optName).toList()
      });
    }
    (value as List<dynamic>).add(nextNum);
    return Transaction.success(value);
  }, applyLocally: false);
  if (!result.committed) {
    return push(list);
  }
  return result;
}
