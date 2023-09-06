import 'package:hooks_riverpod/hooks_riverpod.dart';

final itemCountFamily = StateProviderFamily<int, int>((ref, id) {
  return 0; // 初期値を設定
});