

import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_man/model/data.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DataFetcher {

  static const String hiveBoxName = 'Data';

  static Box<Data> getDataBox() => Hive.box<Data>(hiveBoxName);




  Future<List<dynamic>> _fetchDataFromApi() async {
      const String apiUrl = 'https://jsonplaceholder.typicode.com/photos';
      final Response response = await http.get(Uri.parse(apiUrl));
      final List<dynamic> data = json.decode(response.body);
      return data;
  }

  Future<void> _putDataToDB() async{
    _fetchDataFromApi().then((value) =>
    {for(var element in value) getDataBox().add(Data.fromJson(element))});

  }



  getData() async{
    getDataBox().clear();
    await _putDataToDB();
  }


}

