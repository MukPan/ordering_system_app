import 'opt_obj.dart';

//ex. 使用例
//カートに追加ボタンを押下
//プロバイダーで共有しているリストに商品を追加する
// void main() {
//   List<ItemObj> cartList = []; //これをカートとする
//   cartList.add( //カートに追加
//       ItemObj(
//         itemName: "唐揚げ",
//         itemPrice: 300,
//         qty: 3,
//         optList: [
//           OptObj(optName: "焼きチーズ", optPrice: 100),
//           OptObj(optName: "ケチャップ", optPrice: 0),
//         ]
//       )
//   );
// }

///カートに追加用の商品オブジェクト
class ItemObj {
  ItemObj({
    required this.itemName,
    required this.itemPrice,
    required this.qty,
    required this.optList,
  });
  ///商品名
  final String itemName;
  ///商品価格
  final int itemPrice;
  ///個数
  final int qty;
  ///オプションリスト
  final List<OptObj> optList;

  ///小計を算出して返すメソッド
  int getSubtotal() {
    //全てのオプション価格の合計
    final int optsPrice = (optList.isNotEmpty)
      ?optList
        .map((optObj) => optObj.optPrice)
        .reduce((sum, price) => sum + price)
      :0;

    return qty * (itemPrice + optsPrice);
  }
}