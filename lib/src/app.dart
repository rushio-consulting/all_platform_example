import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rc_cross_platform/rc_cross_platform.dart';
import 'package:stashall/src/providers/reactions.dart';
import 'package:stashall/src/providers/stores.dart';
import 'package:stashall/src/views/home.dart';
import 'package:stashall/src/views/loading.dart';

class Stashall extends StatefulWidget {
  final Platform platform;

  Stashall({@required this.platform});

  @override
  _StashallState createState() => _StashallState();
}

class _StashallState extends State<Stashall> {
  @override
  Widget build(BuildContext context) {
    //  add store and things we need to inject here
    return Provider<Platform>.value(
      value: widget.platform,
      child: StoresProvider(
        child: ReactionsProvider(
          child: StashallApp(),
        ),
      ),
    );
  }
}

class StashallApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stashall',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingView(),
      onGenerateRoute: (routeSettings) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (c, _, __) {
            return MyHomePage(
              title: 'Hello World !',
            );
          },
        );
      },
    );
  }
}
