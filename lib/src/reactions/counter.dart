import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stashall/src/platform_specific/load_counter/load_counter.dart';
import 'package:stashall/src/platform_specific/platform/platform.dart';
import 'package:stashall/src/platform_specific/save_counter/save_counter_base.dart';
import 'package:stashall/src/platform_specific/save_counter/save_counter.dart';
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
  SaveCounterBase saveCounterBase;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    saveCounterBase.dispose();
    super.dispose();
  }

  Future<void> _init() async {
    await _loadCounter();
    await _initReactions();
  }

  Future<void> _loadCounter() async {
    int value = 0;
    if (widget.platform.isDesktop) {
      value = await LoadCounter('test.db').loadCounter();
    } else if (widget.platform.isMobile) {
      final directory = await getApplicationDocumentsDirectory();
      value = await LoadCounter('${directory.path}/test.db').loadCounter();
    } else if (widget.platform.isWeb) {
      await Future.value();
      value = await LoadCounter(null).loadCounter();
    }
    widget.counterStore.counter = value;
    widget.appStore.finishLoadingCounter();
  }

  Future<void> _initReactions() async {
    if (widget.platform.isDesktop) {
      await Future.value();
      saveCounterBase = SaveCounter('test.db', widget.counterStore);
    } else if (widget.platform.isMobile) {
      final directory = await getApplicationDocumentsDirectory();
      saveCounterBase =
          SaveCounter('${directory.path}/test.db', widget.counterStore);
    } else if (widget.platform.isWeb) {
      await Future.value();
      saveCounterBase = SaveCounter(null, widget.counterStore);
    }
    widget.appStore.finishSaveCounterReaction();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
