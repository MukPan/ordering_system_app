
import 'package:flutter/cupertino.dart';
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
    // CounterProviderを取得
    // final counterProvider = Provider.of<CounterProvider>(context);

    return
    Container(
      child: Text('$subTotal円', style: const TextStyle(fontSize: 30, height: 1),),
    );
  }
}