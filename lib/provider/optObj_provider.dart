import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'opt_is_enabled.dart';
class OptionObj extends Notifier<OptionObj?> {
  String optName;
  double optPrice;

  OptionObj({
    required this.optName,
    required this.optPrice,
  });

  @override
  OptionObj? build() {
    return this;
  }
}

class OptionObjNotifier extends Notifier<OptionObj?> {
  OptionObjNotifier() : super();

  void updateOption(OptionObj optionObj) {
    state = optionObj;
  }

  void clearOption() {
    state = null;
  }

  @override
  OptionObj? build() {
    return state;
  }
}


final optionObjectProvider = StateProvider<OptionObj>((ref) => OptionObj(optName: '', optPrice: 0.0));



void updateOptionObject(WidgetRef ref, String optName, double optPrice) {
  final isEnabledNow = ref.read(optIsEnabledFamily(optName));
  if (!isEnabledNow) {
    final newOptionObj = OptionObj(optName: optName, optPrice: optPrice);
    ref.read(optionObjectProvider.notifier).state = newOptionObj;
  }
}