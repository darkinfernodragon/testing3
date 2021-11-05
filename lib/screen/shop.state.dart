import 'package:flutter/material.dart';

class StateWidget extends StatefulWidget {
  final Widget child;

  StateWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
    _StateWidgetState createState() => _StateWidgetState();
  }

class _StateWidgetState extends State<StateWidget> {
  int counter = 0;

  void incrementCounter() {
    final provider = StateShopScreen.of(context);
    provider.incrementCounter();
  }

  @override
  Widget build(BuildContext context) => StateShopScreen(child: widget.child, counter: counter,stateWidget: this);
}

class StateShopScreen extends InheritedWidget {
  final int counter;
  final _StateWidgetState stateWidget;

  StateShopScreen({Key? key,required Widget child, required this.counter, required this.stateWidget}) : super(key: key, child: child);
  
  static _StateWidgetState of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<StateShopScreen>()!.stateWidget;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }
}