import 'package:cash_register_app/component/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../component/default_circular_progress_indicator.dart';
import '../database/submit_order_list_future_provider.dart';




//送信完了ページ
class SubmissionCompletionPage extends HookConsumerWidget {
  const SubmissionCompletionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newOrderNumAsyVal = ref.watch(submitOrderListFutureProvider);

    //DBに送信するまで待機
    return newOrderNumAsyVal.when(
      loading: () => const DefaultCircularProgressIndicator(),
      error: (err, stack) => Container(),
      data: (newOrderNum) {
        print("newOrderNum: $newOrderNum");
        //注文番号の発行に失敗した時
        if (newOrderNum == -1) {
          return const Scaffold(
            appBar: DefaultAppBar(title: "エラー"),
            body: Center(
              child: Text("エラーが発生しました。"),
            )
          );
        }
        return Scaffold(
          appBar: const DefaultAppBar(
            title: "注文完了",
            displayBackBtn: false
          ),
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Text(
                  "ご注文ありがとうございます。\n\n"
                      "こちらの画面を店員に見せて、\n"
                      "会計を完了してください。\n\n"
                      "ご注文番号\n\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              //注文番号
              Expanded(
                child: Text(
                  newOrderNum.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 80,
                  ),
                ),
              )
            ],
          ), //項目リスト
        );
      },
    );
  }
}
