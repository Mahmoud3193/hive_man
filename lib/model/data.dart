

import 'package:hive/hive.dart';


@HiveType(typeId: 1)
class Data extends HiveObject{

  @HiveField(0)
  late int albumId;
  @HiveField(1)
  late int id;
  @HiveField(2)
  late String title;
  @HiveField(3)
  late String url;
  @HiveField(4)
  late String thumbnailUrl;


  Data(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  factory Data.fromJson(dynamic json) {
    return Data(json["albumId"], json["id"], json["title"], json["url"], json["thumbnailUrl"]);
  }

}

// doo() async {
//   var box = await Hive.openBox('testBox');
//   await box.putAt(0, Data());
// }
