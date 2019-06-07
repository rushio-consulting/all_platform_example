// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$AppStore on AppStoreBase, Store {
  final _$isLoadingAtom = Atom(name: 'AppStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context
        .checkIfStateModificationsAreAllowed(_$isLoadingAtom);
    super.isLoading = value;
    _$isLoadingAtom.reportChanged();
  }

  final _$saveCounterReactionIsInitAtom =
      Atom(name: 'AppStoreBase.saveCounterReactionIsInit');

  @override
  bool get saveCounterReactionIsInit {
    _$saveCounterReactionIsInitAtom.reportObserved();
    return super.saveCounterReactionIsInit;
  }

  @override
  set saveCounterReactionIsInit(bool value) {
    _$saveCounterReactionIsInitAtom.context
        .checkIfStateModificationsAreAllowed(_$saveCounterReactionIsInitAtom);
    super.saveCounterReactionIsInit = value;
    _$saveCounterReactionIsInitAtom.reportChanged();
  }

  final _$loadingCounterAtom = Atom(name: 'AppStoreBase.loadingCounter');

  @override
  bool get loadingCounter {
    _$loadingCounterAtom.reportObserved();
    return super.loadingCounter;
  }

  @override
  set loadingCounter(bool value) {
    _$loadingCounterAtom.context
        .checkIfStateModificationsAreAllowed(_$loadingCounterAtom);
    super.loadingCounter = value;
    _$loadingCounterAtom.reportChanged();
  }

  final _$AppStoreBaseActionController = ActionController(name: 'AppStoreBase');

  @override
  void finishSaveCounterReaction() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction();
    try {
      return super.finishSaveCounterReaction();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void finishLoadingCounter() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction();
    try {
      return super.finishLoadingCounter();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void init() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction();
    try {
      return super.init();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
