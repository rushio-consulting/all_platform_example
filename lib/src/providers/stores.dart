import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stashall/src/stores/app/app.dart';
import 'package:stashall/src/stores/counter/counter.dart';

class StoresProvider extends StatefulWidget {
  final Widget child;

  StoresProvider({@required this.child});

  @override
  _StoresProviderState createState() => _StoresProviderState();
}

class _StoresProviderState extends State<StoresProvider> {
  CounterStore counterStore;
  AppStore appStore;

  @override
  void initState() {
    super.initState();
    counterStore = CounterStore();
    appStore = AppStore();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CounterStore>.value(
          value: counterStore,
        ),
        Provider<AppStore>.value(
          value: appStore,
        ),
      ],
      child: widget.child,
    );
  }
}
