import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:stashall/src/platform_specific/rc_cross_platform/platform.dart';
import 'package:stashall/src/platform_specific/rc_cross_preferences/rc_cross_preferences.dart';
import 'package:stashall/src/stores/app/app.dart';
import 'package:stashall/src/stores/counter/counter.dart';

class Counter extends StatefulWidget {
  final AppStore appStore;
  final CounterStore counterStore;
  final Platform platform;
  final Widget child;

  Counter({
    @required this.child,
    @required this.appStore,
    @required this.counterStore,
    @required this.platform,
  });

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  RcCrossPreferences rcCrossPreferences;
  ReactionDisposer _saveReactionDisposer;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _saveReactionDisposer();
    super.dispose();
  }

  Future<void> _init() async {
    rcCrossPreferences = await RcCrossPreferences.getInstance(path: 'test.db');
    await _loadCounter();
    await _initReactions();
  }

  Future<void> _loadCounter() async {
    widget.counterStore.counter = rcCrossPreferences.getInt(
      'counter',
      defaultValue: 0,
    );
    widget.appStore.finishLoadingCounter();
  }

  Future<void> _initReactions() async {
    _saveReactionDisposer =
        reaction((_) => widget.counterStore.counter, (counter) {
      rcCrossPreferences.setInt('counter', counter);
    });
    widget.appStore.finishSaveCounterReaction();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
