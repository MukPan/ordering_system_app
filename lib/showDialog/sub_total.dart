
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/amount_per_item.dart';
import '../provider/countprovider.dart';




class SubTotalWidget extends HookConsumerWidget {
  const SubTotalWidget({super.key});



  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final amountPer = ref.watch(amountPerItemProvider);
    final counter = ref.watch(counterProvider);
    final subTotal = amountPer * counter;

    print('amount:$amountPer');
    // CounterProviderを取得
    // final counterProvider = Provider.of<CounterProvider>(context);

    return
    Container(
      child: Text('$subTotal円', style: TextStyle(fontSize: 30.sp, height: 1),),
    );
  }
}