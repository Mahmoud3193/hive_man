

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screen/home.dart';

main () {

  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "MyApp",
      debugShowCheckedModeBanner: false,
      home: MyHomeApp(),
    );
  }
}
