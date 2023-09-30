import 'package:hooks_riverpod/hooks_riverpod.dart';

final optIsEnabledFamily = StateProvider.family<bool, String>((ref, id) {
  return false;
});