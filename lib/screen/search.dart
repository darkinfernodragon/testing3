import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchScreen extends StatefulWidget {
  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.purple,
      ),
      body: Text('Back')
    );
  }
}