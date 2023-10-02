import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges; //上のmaterialと競合を防ぐ

class ToTotalBar extends StatelessWidget {
  const ToTotalBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shadowColor: Colors.black,
      elevation: 20,
      color: Colors.white,
      notchMargin: 6.0,
      height: MediaQuery.of(context).size.height * (1/7), //bottomBarの高さ
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(),
        StadiumBorder(
          side: BorderSide(),
        ),
      ),
      child: Container(
        // padding: const EdgeInsets.all(20),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textDirection: TextDirection.ltr,
          children: [
            //カートアイコン
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const badges.Badge(
                badgeContent: Text("2", style: TextStyle(color: Colors.white, fontSize: 15)),
                badgeStyle: badges.BadgeStyle(badgeColor: Colors.red, padding: EdgeInsets.all(8)),
                // position: badges.BadgePosition.,
                child: Icon(Icons.shopping_cart, size: 50,),
              ),
            ),
            //合計金額
            Container(
              margin: const EdgeInsets.only(left: 20, right: 40),
              child: const Text("1,000円", style: TextStyle(fontWeight: FontWeight.bold, fontSize:  30)),
            ),
            //確認ページへの遷移ボタン
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange)),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "レジに進む",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )

            // Flexible(
            //     flex: 1,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly, //多分変更
            //       children: [
            //         Stack(
            //           clipBehavior: Clip.none,
            //           children: [
            //             const Icon(Icons.shopping_cart, size: 45 * (7 / 10)),
            //             Positioned(
            //                 top: -10,
            //                 right: -10,
            //                 child: Container(
            //                     width: 30 * 2 / 3,
            //                     height: 30 * (2 / 3),
            //                     decoration: const BoxDecoration(
            //                         color: Colors.redAccent,
            //                         shape: BoxShape.circle),
            //                     child: const Stack(children: [
            //                       Positioned(
            //                           top: 5 * (2 / 3),
            //                           right: 10 * (1 / 2),
            //                           child: Text(
            //                             '1',
            //                             style: TextStyle(color: Colors.white),
            //                           ))
            //                     ])))
            //           ],
            //         ),
            //         const Text("¥100")
            //       ],
            //     )),
            // Flexible(
            //   flex: 1,
            //   fit: FlexFit.tight,
            //   child: ElevatedButton(
            //     style: ButtonStyle(
            //         backgroundColor:
            //             MaterialStateProperty.all<Color>(Colors.orange)),
            //     onPressed: null,
            //     child: const Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 15),
            //       child: Text(
            //         "レジに進む",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //             fontSize: 15,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
