

import 'package:flutter/material.dart';
import 'package:hive_man/service/fetch_api.dart';
import 'list_item.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {

  DataFetcher f = DataFetcher();
  List _data = [];

  _fetchData() async {
    _data = await f.getData();
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    _fetchData();
    return Scaffold(

      appBar: AppBar(title: Text("pics app"),),
        body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) => ListItem(_data[index]),
        )
    );
  }
}
