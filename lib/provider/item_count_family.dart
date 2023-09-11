import 'package:hooks_riverpod/hooks_riverpod.dart';

final itemCountFamily = StateProvider.family<int, int>((ref, id) {
  return 1; // 初期値を設定
});