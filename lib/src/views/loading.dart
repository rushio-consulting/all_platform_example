import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:stashall/src/stores/app/app.dart';

class LoadingView extends StatefulWidget {
  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  ReactionDisposer _loadingDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final appStore = Provider.of<AppStore>(context);
    _loadingDisposer = when((_) => !appStore.isLoading, () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  void dispose() {
    if (_loadingDisposer != null) {
      _loadingDisposer();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
