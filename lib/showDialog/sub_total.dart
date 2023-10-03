import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/amount_per_item.dart';
import '../provider/countprovider.dart';




class SubTotalWidget extends HookConsumerWidget {


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final amount_per = ref.watch(amountPerItemProvider);
    final counter = ref.watch(counterProvider);
    final sub_total = amount_per * counter;
    // CounterProviderを取得
    // final counterProvider = Provider.of<CounterProvider>(context);

    return
    Container(
      child: Text('$sub_total円', style: const TextStyle(fontSize: 30, height: 1),),
    );
  }
}