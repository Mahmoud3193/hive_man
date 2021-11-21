

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_man/model/data.dart';
import 'package:hive_man/service/fetch_api.dart';
import 'list_item.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {

  DataFetcher f = DataFetcher();



  @override
  void dispose() {
    Hive.box('Data').close();
    super.dispose();
  }

  _fetchData() async {
    await f.getData();
  }

  @override
  Widget build(BuildContext context) {
    _fetchData();
    return Scaffold(

      appBar: AppBar(title: const Text('pics app'),),
        body: ValueListenableBuilder<Box<Data>>(
          valueListenable: DataFetcher.getDataBox().listenable(),
          builder: (context, box, _) {
            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) => ListItem( box.values.toList()[index]),
            );
          },
        )
    );
  }
}
