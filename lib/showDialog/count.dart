import 'package:cash_register_app/database/item_infos.dart';
import 'package:cash_register_app/pages/total_counter.dart';
import 'package:cash_register_app/provider/cart_provider.dart';
import 'package:cash_register_app/provider/countprovider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../dialog/alert_dialog_texts.dart';
import '../dialog/default_alert_dialog.dart';


// class CounterProvider with ChangeNotifier {
//   // int _counter = 1;
//
//   // int get counter => _counter;
//
//   void incrementCounter(WidgetRef ref) {
//     ref.read(counterProvider.notifier).state++;
//     // _counter++;
//     // notifyListeners(); // リスナーに変更を通知
//   }
//
//   void decrement(WidgetRef ref) {
//     ref.read(counterProvider.notifier).state--;
//     // if (_counter > 0) {
//     //   _counter--;
//     //   notifyListeners(); // リスナーに変更を通知
//     // }
//   }
// }


// class Cuntpage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => CounterProvider(), // プロバイダーを作成
//       child: CounterWidget(), // カウンターウィジェットを表示
//     );
//   }
// }

class CounterWidget extends HookConsumerWidget {
  const CounterWidget({super.key, this.displayTrashBtn = false, this.cartIndex = 0});

  ///削除ボタンを有効にするか
  final bool displayTrashBtn;
  ///編集中のindex
  final int cartIndex;



  void incrementCounter(WidgetRef ref) {
    ref.read(counterProvider.notifier).state++;
    // _counter++;
    // notifyListeners(); // リスナーに変更を通知
  }

  void decrement(WidgetRef ref) {
    ref.read(counterProvider.notifier).state--;
    // if (_counter > 0) {
    //   _counter--;
    //   notifyListeners(); // リスナーに変更を通知
    // }
  }

  void removeItem(WidgetRef ref, int cartIndex) {
    final beforeCartList = ref.read(cartListProvider);
    beforeCartList.removeAt(cartIndex);
    //プロバイダーを更新
    ref.read(cartListProvider.notifier).state = [...beforeCartList];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // CounterProviderを取得
    // final counterProvider = Provider.of<CounterProvider>(context);

    final counter = ref.watch(counterProvider);

    return Row(
      children: [
        IconButton(
          icon: (counter <= 1) ? const Icon(Icons.delete) : const Icon(Icons.remove),
          // onPressed: (counter > 1) ? () {
          //   decrement(ref); // ボタンが押されたときにデクリメント
          // } : null,
          onPressed: ((displayTrashBtn && counter > 0) || counter > 1) ? () async { //qty <= 0 || !countBtnIsEnabled
            //カウントが1のとき
            bool isRemove = false;
            if (counter == 1) {
              isRemove = await showDialog(
                  context: context,
                  builder: (content) => DefaultAlertDialog(
                    alertDialogTexts: AlertDialogTexts(
                        title: const Text("商品の削除"),
                        content: const Text("この商品を注文リストから削除します。\nよろしいですか。")),
                  )
              ) ?? false;
            }
            //更新
            if (counter == 1 && isRemove) { //カウントが1かつ削除ボタン実行
              removeItem(ref, cartIndex);
              //ダイアログを閉じる
              if (context.mounted) {
                total_counter(context, ref);
                Navigator.of(context).pop();
              }
              return;
            }
            if (counter > 1 || isRemove) {
              decrement(ref);
              return;
            }
          } : null,
        ),
        Text('$counter', style: const TextStyle(fontSize: 20)),
        IconButton(
          icon: const Icon(Icons.add_circle),
          onPressed:  (counter < 5) ? () {
            incrementCounter(ref); // ボタンが押されたときにインクリメント
          } : null,
        ),
      ],
    );
  }
}
