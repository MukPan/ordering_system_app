import 'package:cash_register_app/context/send_order_btn.dart';
import 'package:cash_register_app/context/total_amount.dart';
import 'package:cash_register_app/context/total_count.dart';
import 'package:cash_register_app/provider/total_counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TotalBar extends HookConsumerWidget {
  const TotalBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalCount = ref.watch(total_counterProvider);
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
            child: /*TextButton(
                onPressed: (totalCount > 0)
                  ? () {}
                  : null,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange
                ),
                child: const Text(
                  "注文を確定する",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,

                  ),
                )
            ),*/SendOrderBtn()
          ),
          Spacer(),
        ],
      ),
    );
  }
}
