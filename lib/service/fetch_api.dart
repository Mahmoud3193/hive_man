

import 'dart:convert';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_man/model/data.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DataFetcher {

  static const String hiveBoxName = "pics";




  Future<List<dynamic>> fetchDataFromApi() async {
      const String apiUrl = "https://jsonplaceholder.typicode.com/photos";
      final Response response = await http.get(Uri.parse(apiUrl));
      final List<dynamic> data = json.decode(response.body);
      return data;
  }


  Future<List<Data>> convertMapsToObjects() async {
    List<Data> d = [];
    for (var element in await fetchDataFromApi()) {
      d.add(Data.fromJson(element));
    }
    return d;
  }

  Future<void> _putDataInHive() async {
    Hive.init(join((await getApplicationDocumentsDirectory()).path,"DB.db"));
    var box = await Hive.openBox<Data>(hiveBoxName);
    convertMapsToObjects().then((value) => value.forEach((element) {box.add(element);}));
  }

  getData() async{
      await _putDataInHive();
      Box box = Hive.box<Data>(hiveBoxName);
      var d = box.values;
      return d;
  }

var x;
}

