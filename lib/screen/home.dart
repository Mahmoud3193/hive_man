

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



  @override
  void dispose() {
    Hive.box(DataFetcher.hiveBoxName).close();
    super.dispose();
  }

  void _fetchData() async {
    print("initState is called");
    await DataFetcher.putDataToDB();

  }


  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: GestureDetector(child: Text('pics app'), onTap: (){setState(() {

      });} ,),),
        body: ValueListenableBuilder<Box<Data>>(
          valueListenable: DataFetcher.getDataBox().listenable(),
          builder: (context, box, _) {
            print("${box.values.length} items");
            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) => ListItem(box.values.toList().cast<Data>()[index]),
            );
          },
        )
    );
  }
}
