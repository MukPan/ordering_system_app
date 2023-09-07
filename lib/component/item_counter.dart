import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/item_count_family.dart';

class ItemCounter extends HookConsumerWidget {
  const ItemCounter({Key? key, required this.index}) : super(key: key);

  ///行番号
  final int index;

  ///個数増加
  void _increaseCount(WidgetRef ref) {
    ref.read(itemCountFamily(index).notifier).state++; //書込
  }

  ///個数減少
  void _decreaseCount(WidgetRef ref) {
    ref.read(itemCountFamily(index).notifier).state--; //書込
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final int count = ref.watch(itemCountFamily(index)); //読取

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0x10000000),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: (count <= 0) ? null : () {
                _decreaseCount(ref);
              },
              icon: const Icon(Icons.remove)
          ),
          Text(count.toString()),
          IconButton(
              onPressed: () {
                _increaseCount(ref);
              },
              icon: const Icon(Icons.add)
          ),
        ],
      ),
    );
  }
}