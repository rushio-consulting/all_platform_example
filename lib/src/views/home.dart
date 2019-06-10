import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rc_cross_platform/rc_cross_platform.dart';
import 'package:stashall/src/stores/counter/counter.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    final counterStore = Provider.of<CounterStore>(context);
    counterStore.increment();
  }

  @override
  Widget build(BuildContext context) {
    final platform = Provider.of<Platform>(context);
    final counterStore = Provider.of<CounterStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('The app is running on : ${platform.platformName}'),
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (c) => Text(
                    '${counterStore.counter}',
                    style: Theme.of(context).textTheme.display1,
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
