import 'package:cash_register_app/component/default_app_bar.dart';
import 'package:cash_register_app/database/item_infos.dart';
import 'package:cash_register_app/pages/confirm_ordering_page.dart';
import 'package:cash_register_app/showDialog/showDialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../object/item_obj.dart';


class Menu_page extends HookConsumerWidget {
  const Menu_page({super.key});

  ///注文内容確認ページへの遷移メソッド
  void moveConfirmOrderingPage(BuildContext context) => {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ConfirmOrderingPage()
    ))
  };

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(

      body:
      Container(
        margin: const EdgeInsets.all(30), //外周の余白
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 30,     //ボックス左右間のスペース
            mainAxisSpacing: 30,      //ボックス上下間のスペース
            crossAxisCount: 2,        //ボックスを横に並べる数
          ),
          itemCount: 10, //要素数
          //指定した要素の数分を生成
          itemBuilder: (context, index) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 3, //影の大きさ
                  foregroundColor: Colors.grey.withAlpha(100), //ボタンを押下時のエフェクト色と文字色(子要素で上書き可能)
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)) //角ばったボタン、数値を上げると丸くなる
                  ),
                ),
                onPressed: () {
                  showCustomDialog(context,ref);
                }, //押下時ポップアップ
                child: const Text( //buttonの中身、商品名や画像、値段など
                  "button",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                )
            );
          },
        ),

      ),
    );

    //**邪魔だったり必要なかったらコメントアウト(コードの先頭に//をつける)してね**//
    floatingActionButton: FloatingActionButton(
      onPressed: () { moveConfirmOrderingPage(context); },
      tooltip: "デバッグ用遷移ボタン\n邪魔だったら消してね",
      child: const Icon(Icons.arrow_right_alt),
    );
    //********************************************************************/
  }
}