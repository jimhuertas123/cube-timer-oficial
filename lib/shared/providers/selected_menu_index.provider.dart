import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<int> validMenuIndexes = [0, 2, 3, 5, 6];

class SelectedMenuIndexNotifier extends Notifier<int> {
  @override
  int build() => validMenuIndexes.first;

  void setIndex(int index) {
    if (!validMenuIndexes.contains(index)) {
      throw ArgumentError('Invalid menu index: $index');
    }
    state = index;
  }
}

final selectedMenuIndexProvider =
    NotifierProvider<SelectedMenuIndexNotifier, int>(
      SelectedMenuIndexNotifier.new,
    );
