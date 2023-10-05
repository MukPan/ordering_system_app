import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/total_provider.dart';

class TotalAmount extends HookConsumerWidget {
  const TotalAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total = ref.watch(totalProvider);
    return  Text(
      "${total}円",
      style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold
      ),
    );
  }
}
