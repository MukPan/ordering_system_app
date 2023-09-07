import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TotalAmount extends HookConsumerWidget {
  const TotalAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Text(
      "1900円",
      style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold
      ),
    );
  }
}
