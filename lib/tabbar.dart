import 'package:cash_register_app/common/default_material_state.dart';
import 'package:cash_register_app/context/to-total_bar.dart';
import 'package:cash_register_app/tabpage/foofpage.dart';
import 'package:cash_register_app/tabpage/menupage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class Tab_bar extends StatelessWidget {
  const Tab_bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      // colorScheme:　ゴミ、白黒に変更不可
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        highlightColor: Colors.white,
        indicatorColor: Colors.white,
        useMaterial3: true,
        bottomAppBarTheme: const BottomAppBarTheme(
          surfaceTintColor: Colors.white,
        ),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: const ToTotalBar(),
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(),
            title: const Text('メニュー'), //ここシス研のアイコンに
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            shape: const Border(
                bottom: BorderSide(color: Colors.grey)
            ),
            bottom: TabBar(
              //ホバーやクリック時のカラーを調整する
              overlayColor: MaterialStateProperty.resolveWith(hoverAndTapIsGrey),
              indicatorColor: Colors.orange, //選択の下線
              dividerColor: Colors.grey,
              labelColor: Colors.orange,
              tabs: const [
                Tab(child: Text('フード', style: TextStyle(fontWeight: FontWeight.bold))),
                Tab(child: Text('ドリンク', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
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
