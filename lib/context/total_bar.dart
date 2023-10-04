import 'package:cash_register_app/context/send_order_btn.dart';
import 'package:cash_register_app/context/total_amount.dart';
import 'package:cash_register_app/context/total_count.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TotalBar extends StatelessWidget {
  const TotalBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shadowColor: Colors.black,
      elevation: 20,
      color: Colors.white,
      notchMargin: 6.0,
      height: MediaQuery.of(context).size.height * (1/4), //bottomBarの高さ
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(),
        StadiumBorder(
          side: BorderSide(),
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TotalCount(),
              TotalAmount(),
            ],
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            height: 50,
            // margin: EdgeInsets.only(top: 10),
            child: SendOrderBtn(),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
