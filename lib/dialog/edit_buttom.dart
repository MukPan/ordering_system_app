


import 'package:cash_register_app/showDialog/sub_total.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../showDialog/count.dart';


class EditButtom extends StatelessWidget {
  final VoidCallback onPressed;

  const EditButtom({required this.onPressed});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    print(width);
    print(height);

    return Column(
      children: [

        // LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        // final parentWidth = constraints.maxWidth;
        // final parentHeight = constraints.maxHeight;

      //カートに追加ボタン
      Center(
        child: SizedBox(
          width: 200.w, //横幅
          height: 50.h, //高さ
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, //背景色
              foregroundColor: Colors.white,
            ),
            onPressed: onPressed,
            // onPressed: () {
            //   final cartListController = ref.watch(cartListProvider);
            //   final cartService = CartListService(cartListController);
            //   cartService.updateItemToCart(context, ref, iteminfo, cartIndex);
            //   Navigator.of(context).pop();
            // },
            child: Text('注文を更新', style: TextStyle(color: Colors.white, fontSize: 15.sp)),
          ),
        ),
      )
      ],
    );

    // return Container(
    //
    //   width: width * 0.3 , // 横幅
    //   height: height * 0.1, // 高さ
    //
    //   // margin: const EdgeInsets.symmetric(vertical: 10),
    //
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //
    //
    //
    //   // LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    //   // final parentWidth = constraints.maxWidth;
    //   // final parentHeight = constraints.maxHeight;
    //   // // カウンター
    //     CounterWidget(),
    //   // 小計
    //     SubTotalWidget(),
    //     SizedBox(
    //
    //   // width: width * 0.3,
    //   // height: height * 0.2,
    //
    //       child: ElevatedButton(
    //       style: ElevatedButton.styleFrom(
    //       backgroundColor: Colors.orange, // 背景色
    //       foregroundColor: Colors.white,
    //       ),
    //       onPressed: onPressed,
    //         child: Text('カートに追加', style: TextStyle(color: Colors.white, fontSize: 15.sp)),
    //       ),
    // ),
    //
    //     ],
    //   ),
    // );
  }
}
