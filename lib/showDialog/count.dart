import 'package:cash_register_app/provider/countprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';


// class CounterProvider with ChangeNotifier {
//   // int _counter = 1;
//
//   // int get counter => _counter;
//
//   void incrementCounter(WidgetRef ref) {
//     ref.read(counterProvider.notifier).state++;
//     // _counter++;
//     // notifyListeners(); // リスナーに変更を通知
//   }
//
//   void decrement(WidgetRef ref) {
//     ref.read(counterProvider.notifier).state--;
//     // if (_counter > 0) {
//     //   _counter--;
//     //   notifyListeners(); // リスナーに変更を通知
//     // }
//   }
// }


// class Cuntpage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => CounterProvider(), // プロバイダーを作成
//       child: CounterWidget(), // カウンターウィジェットを表示
//     );
//   }
// }

class CounterWidget extends HookConsumerWidget {

  void incrementCounter(WidgetRef ref) {
    ref.read(counterProvider.notifier).state++;
    // _counter++;
    // notifyListeners(); // リスナーに変更を通知
  }

  void decrement(WidgetRef ref) {
    ref.read(counterProvider.notifier).state--;
    // if (_counter > 0) {
    //   _counter--;
    //   notifyListeners(); // リスナーに変更を通知
    // }
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // CounterProviderを取得
    // final counterProvider = Provider.of<CounterProvider>(context);

   final counter = ref.watch(counterProvider);

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle),
          onPressed: () {
           decrement(ref); // ボタンが押されたときにデクリメント
          },
        ),
        Text('${counter}'),
        IconButton(
          icon: const Icon(Icons.add_circle),
          onPressed: () {
            incrementCounter(ref); // ボタンが押されたときにインクリメント
          },
        ),
      ],
    );
  }
}
