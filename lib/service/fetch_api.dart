

import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_man/model/data.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DataFetcher {

  static const String hiveBoxName = 'Data';

  static Box<Data> getDataBox() => Hive.box<Data>(hiveBoxName);
  static List<dynamic> _apiData = [];



  static Future<void> _fetchDataFromApi() async {
      const String apiUrl = 'https://jsonplaceholder.typicode.com/albums/1/photos';
      final Response response = await http.get(Uri.parse(apiUrl));
      final List<dynamic> data = json.decode(response.body);
      _apiData = data;
  }

  static Future<void> putDataToDB() async{
    await _fetchDataFromApi();
    if(_apiData.isNotEmpty){
      await getDataBox().clear();
      print("cleared");
      for (var element in _apiData) {
        getDataBox().add(Data.fromJson(element));
      }
      print("added");
      _apiData.clear();
    }
  }

}

