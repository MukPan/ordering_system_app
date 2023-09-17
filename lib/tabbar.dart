import 'package:cash_register_app/context/to-total_bar.dart';
import 'package:cash_register_app/tabpage/foofpage.dart';
import 'package:cash_register_app/tabpage/menupage.dart';
import 'package:flutter/material.dart';



class Tab_bar extends StatelessWidget {
  const Tab_bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: const ToTotalBar(),
          appBar: AppBar(
            title: const Text('メニュー'),
            bottom: const TabBar(tabs: <Widget>[
              Tab(child: Text('フード'),),
              Tab(child: Text('ドリンク') ),
            ]),
          ),
          body: const TabBarView(
            children: <Widget>[
              Center(child:Food_page()),
              Center(child:Menu_page()),
            ],
          ),
        ),
      ),
    );
  }
}
