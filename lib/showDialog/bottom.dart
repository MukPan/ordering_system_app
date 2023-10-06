import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../database/item_infos.dart';
import '../provider/amount_per_item.dart';
import '../provider/opt_is_enabled.dart';



class OptionTile extends HookConsumerWidget {
  const OptionTile({Key? key, required this.optInfo}) : super(key: key);

  ///オプション名
  final OptInfo optInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //オプション名
    final optName = optInfo.optName;
    //オプション価格
    final optPrice = optInfo.optPrice;
    //オプションは有効か
    final bool isEnabled = ref.watch(optIsEnabledFamily(optName));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // これで両端に寄せる
      children: [
        Text("$optName${(optPrice != 0) ? "(+${NumberFormat("#,###").format(optPrice)}円)" : ""}", style: TextStyle(fontSize: 15.sp),),

        ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, //押したときの波動色
                backgroundColor: (isEnabled) ? Colors.orange : Colors.grey

            ),
            onPressed: () {
              // 1. オプションの有効/無効状態を取得
              final bool isEnabledNow = ref.read(optIsEnabledFamily(optName));
              // // 2. "あり" の場合にのみオブジェクトを更新
              // if (!isEnabledNow) {
              //   print("ボタン");
              //   // 3. オプション情報をプロバイダーを介して更新
              //   updateOptionObject(ref, optName, optPrice.toDouble());
              // }else{
              //   ref.read(optionObjectProvider.notifier).state = null;
              // }
              // 4. 有効/無効の切り替えと価格の更新を行う
              ref.read(optIsEnabledFamily(optName).notifier).state = !isEnabledNow;
              ref.read(amountPerItemProvider.notifier).state += (isEnabledNow) ? -optPrice : optPrice;
            },
            child: Text(
              (isEnabled) ? "あり" : "なし",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
              ),
            )
        ),
      ],
    );
  }
}
