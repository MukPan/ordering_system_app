import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/item_count_family.dart';
import '../provider/total_counter_provider.dart';

class TotalCount extends HookConsumerWidget {
  const TotalCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total_counter = ref.watch(total_counterProvider);
    print(itemCountFamily);
    // StateProviderFamily;
    // ref.read()
    return  Text(
      "合計 ${total_counter}個",
      style: TextStyle(
        fontSize: 20
      ),
    );
  }
}
