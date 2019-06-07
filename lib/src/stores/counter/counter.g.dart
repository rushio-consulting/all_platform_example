// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$CounterStore on CounterStoreBase, Store {
  final _$counterAtom = Atom(name: 'CounterStoreBase.counter');

  @override
  int get counter {
    _$counterAtom.reportObserved();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.context.checkIfStateModificationsAreAllowed(_$counterAtom);
    super.counter = value;
    _$counterAtom.reportChanged();
  }

  final _$CounterStoreBaseActionController =
      ActionController(name: 'CounterStoreBase');

  @override
  void reset() {
    final _$actionInfo = _$CounterStoreBaseActionController.startAction();
    try {
      return super.reset();
    } finally {
      _$CounterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$CounterStoreBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$CounterStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
