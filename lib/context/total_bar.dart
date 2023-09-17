import 'package:cash_register_app/context/total_amount.dart';
import 'package:cash_register_app/context/total_count.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TotalBar extends StatelessWidget {
  const TotalBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
                color: Colors.grey,
              )
          )
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.spaceBetween,
        children: [

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TotalCount(),
              TotalAmount(),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 50,
            // margin: EdgeInsets.only(top: 10),
            child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                ),
                child: const Text(
                  "注文を確定する",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
