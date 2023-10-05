import 'package:cash_register_app/dialog/alert_dialog_texts.dart';
import 'package:cash_register_app/dialog/default_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/item_count_family.dart';

class ItemCounter extends HookConsumerWidget {
  const ItemCounter({Key? key, required this.index}) : super(key: key);

  ///行番号
  final int index;

  ///個数増加
  void _increaseCount(WidgetRef ref) {
    ref.read(itemCountFamily(index).notifier).state++; //書込
  }

  ///個数減少
  void _decreaseCount(WidgetRef ref) {
    ref.read(itemCountFamily(index).notifier).state--; //書込
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final int count = ref.watch(itemCountFamily(index)); //読取

    return Container(
    width: 100,
    margin: const EdgeInsets.only(top: 10, bottom: 10),
    decoration: BoxDecoration(
      color: const Color(0x10000000),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: (count <= 0) ? null : () async {
              //カウントが1のとき
              bool isRemove = false;
              if (count == 1) {
                isRemove = await showDialog(
                    context: context,
                    builder: (content) => DefaultAlertDialog(
                      alertDialogTexts: AlertDialogTexts(
                        title: const Text("商品の削除"),
                        content: const Text("注文リストに登録した商品を削除しますか。")
                      ),
                    )
                ) ?? false;
              }

              if (count > 1 || isRemove) _decreaseCount(ref);

            },
            icon: (count <= 1) ? const Icon(Icons.delete) : const Icon(Icons.remove)
        ),
        Text(count.toString()),
        IconButton(
            onPressed: (count >= 5) ? null : () { //上限を設ける
              _increaseCount(ref);
            },
            icon: const Icon(Icons.add)
        ),
      ],
    ),
  );
  }
}