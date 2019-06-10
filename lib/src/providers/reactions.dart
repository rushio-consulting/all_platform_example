import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rc_cross_platform/rc_cross_platform.dart';
import 'package:stashall/src/reactions/counter.dart';
import 'package:stashall/src/stores/app/app.dart';
import 'package:stashall/src/stores/counter/counter.dart';

class ReactionsProvider extends StatefulWidget {
  final Widget child;

  ReactionsProvider({@required this.child});

  @override
  _ReactionsProviderState createState() => _ReactionsProviderState();
}

class _ReactionsProviderState extends State<ReactionsProvider> {
  @override
  Widget build(BuildContext context) {
    final appStore = Provider.of<AppStore>(context);
    final counterStore = Provider.of<CounterStore>(context);
    final platform = Provider.of<Platform>(context);
    return Counter(
      platform: platform,
      appStore: appStore,
      counterStore: counterStore,
      child: widget.child,
    );
  }
}
