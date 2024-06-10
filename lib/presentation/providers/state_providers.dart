import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build() => 0;

  void increaseByOne() {
    state++;
  }
}

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() {
    return false;
  }

  void toogleDarkMode() {
    state = !state;
  }
}

@riverpod
class Username extends _$Username {
  @override
  String build() {
    return 'Iván';
  }

  void changueName(String name) {
    state = name;
  }
}
