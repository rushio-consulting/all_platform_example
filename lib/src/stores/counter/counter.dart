import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class CounterStore = CounterStoreBase with _$CounterStore;

abstract class CounterStoreBase with Store {
  @observable
  int counter;

  CounterStoreBase({this.counter});

  @action
  void reset() {
    counter = 0;
  }

  @action
  void increment() {
    counter++;
  }
}
