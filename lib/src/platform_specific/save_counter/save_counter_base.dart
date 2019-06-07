import 'package:mobx/mobx.dart';
import 'package:stashall/src/stores/counter/counter.dart';

abstract class SaveCounterBase {
  final String path;
  CounterStore counterStore;
  ReactionDisposer _saveReactionDisposer;

  SaveCounterBase(this.path, this.counterStore) {
    _saveReactionDisposer = reaction((_) => counterStore.counter, saveCounter);
  }

  void dispose() => _saveReactionDisposer();

  Future<void> saveCounter(int counter);
}
