import 'package:flutter/material.dart';

class ToTotalBar extends StatelessWidget {
  const ToTotalBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 6.0,
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(),
        StadiumBorder(
          side: BorderSide(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Icon(Icons.shopping_cart, size: 45 * (7 / 10)),
                        Positioned(
                            top: -10,
                            right: -10,
                            child: Container(
                                width: 30 * 2 / 3,
                                height: 30 * (2 / 3),
                                decoration: const BoxDecoration(
                                    color: Colors.redAccent,
                                    shape: BoxShape.circle),
                                child: const Stack(children: [
                                  Positioned(
                                      top: 5 * (2 / 3),
                                      right: 10 * (1 / 2),
                                      child: Text(
                                        '1',
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ])))
                      ],
                    ),
                    const Text("¥100")
                  ],
                )),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange)),
                onPressed: null,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "レジに進む",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
