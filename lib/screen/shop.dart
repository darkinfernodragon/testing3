import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_1/screen/shop.state.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stateWidget = StateShopScreen.of(context);
    final counter = StateShopScreen.of(context).counter;
    return Container(
      child: Column(
        children: [
          Center(child: Text('$counter'),),
          ElevatedButton(
            onPressed: () {
              stateWidget.incrementCounter();
            },
            child: Text('Increment')
          )
        ],
      ),
    );
  }
}