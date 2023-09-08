import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/item_count_family.dart';

class TotalCount extends HookConsumerWidget {
  const TotalCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(itemCountFamily);
    // StateProviderFamily;
    // ref.read()
    return const Text(
      "合計 3個",
      style: TextStyle(
        fontSize: 20
      ),
    );
  }
}
