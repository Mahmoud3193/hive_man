

import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_man/model/data.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DataFetcher {

  static const String hiveBoxName = 'Data';

  static Box<Data> getDataBox() => Hive.box<Data>(hiveBoxName);




  static Future<List<dynamic>> _fetchDataFromApi() async {
      const String apiUrl = 'https://jsonplaceholder.typicode.com/albums/1/photos';
      final Response response = await http.get(Uri.parse(apiUrl));
      final List<dynamic> data = json.decode(response.body);
      return data;
  }

  static Future<void> putDataToDB() async{

    //getDataBox().clear();

    _fetchDataFromApi().then((var value) {
      if(value.isNotEmpty) getDataBox().clear();
      print("cleared");
      for (var element in value) {getDataBox().add(Data.fromJson(element));}
      print("putted");
    });
  }

}

