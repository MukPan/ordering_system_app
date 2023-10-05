import 'package:firebase_database/firebase_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../object/item_obj.dart';
import '../provider/cart_provider.dart';

final db2 = FirebaseDatabase.instance;

const uuid = Uuid();

/// 注文内容を送信して、最後にfutureとして新しい注文番号を返す
final submitOrderListFutureProvider = FutureProvider((ref) async {
  const int maxRetries = 4; // 最大リトライ回数
  int retryIntervalInSeconds = 2; // リトライ間隔（秒）

  int newOrderNum = -1; // 初期値

  for (int retryCount = 0; retryCount < maxRetries; retryCount++) {
    db2.ref("latestOrderNum/").onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print("data: $data");
    });
    // 最新の注文番号を取得し、新しい注文番号の発行(トランザクション)
    TransactionResult result = await db2.ref("latestOrderNum/").runTransaction(
        (Object? mayLatestOrderNum) {
      // nullチェックをするとnullしか返さなくなる
      if (mayLatestOrderNum == null) {
        return Transaction.abort();
      }
      final latestOrderNum = mayLatestOrderNum is String ||
              mayLatestOrderNum is int
          ? int.parse(mayLatestOrderNum.toString())
          : int.parse((mayLatestOrderNum as Map).keys.elementAt(0).toString());
      // 新しい注文番号を発行
      newOrderNum = latestOrderNum + 1;
      // 新しいデータを返す
      return Transaction.success(
          {newOrderNum.toString(): uuid.v4()}); // dbを更新&result変数に反映
    }, applyLocally: false);

    // トランザクションが成功した場合、ループを終了
    if (result.committed) {
      print("break");
      break;
      // リトライの間隔を待機
    } else {
      retryIntervalInSeconds = retryIntervalInSeconds * 2;
      if (retryCount < maxRetries - 1) {
        print("miss");
        await Future.delayed(Duration(seconds: retryIntervalInSeconds));
      }
    }
  }

  // リトライ後も注文番号が取得できなかった場合
  if (newOrderNum == -1) {
    return -1;
  }

  // プロバイダーからカートリストを取得
  List<ItemObj> cartList = ref.read(cartListProvider);

  // latestOrderNumに新しい注文番号を登録
  // await db2.ref("latestOrderNum/").set(newOrderNum);


  // 注文内容が入っていないjson形式をdbに送信
  await db2.ref("orderNums/").update({
    newOrderNum.toString(): {
      "orderList": {},
      "orderStatus": "temp",
      "timestamp": 0,
    }
  });

  // その後注文内容を埋める
  for (final itemObj in cartList) {
    await db2
        .ref("orderNums/$newOrderNum/orderList/")
        .push() // 新しいuuidを作成
        .set({
      "item": itemObj.itemName,
      "options": itemObj.optList.map((optObj) => optObj.optName).toList(),
      "qty": itemObj.qty
    });
  }


  // 最後に新しい注文番号を返す
  return newOrderNum;
});
