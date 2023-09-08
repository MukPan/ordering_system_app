import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';



class Test extends HookConsumerWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int number = ref.watch(numberProvider);
    return Column(
      children: [
        Text(number.toString(
        )),
        TextButton(
            onPressed: () {
          ref.read(numberProvider.notifier).state++;
        },
            child:const Text('test'))
      ]
    );
  }
}

final numberProvider = StateProvider<int>((ref) {
  return 0;
});
