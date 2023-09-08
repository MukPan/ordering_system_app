import 'package:cash_register_app/component/default_app_bar.dart';
import 'package:cash_register_app/pages/confirm_ordering_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  runApp(const ProviderScope(child: MyApp()));
}

//TODO:ListTileに変える
//TODO: 最後までスクロール内容が表示されるようにする
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        highlightColor: Colors.white,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  ///注文内容確認ページへの遷移メソッド
  void moveConfirmOrderingPage(BuildContext context) => {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ConfirmOrderingPage()
    ))
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppBar(title: "商品の選択"),

        body: Container(), // ここから弄る

      //**邪魔だったり必要なかったらコメントアウト(コードの先頭に//をつける)してね**//
        floatingActionButton: FloatingActionButton(
          onPressed: () { moveConfirmOrderingPage(context); },
          tooltip: "デバッグ用遷移ボタン\n邪魔だったら消してね",
          child: const Icon(Icons.arrow_right_alt),
        ),
      //********************************************************************//
    );
  }
}