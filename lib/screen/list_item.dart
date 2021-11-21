
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_man/service/fetch_api.dart';
import 'image_full_view.dart';
import '../model/data.dart';

class ListItem extends StatefulWidget {
  const ListItem(this.data, {Key? key}) : super(key: key);
  final Data data;

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
          onLongPress: () {
            widget.data.delete();
          },
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ImageFullView(widget.data.url)));
          },
          child: Image.network(widget.data.thumbnailUrl,height: 150,width: 150,)
      ),
      title: Text(widget.data.title),
      subtitle: Text('The Photo ID is ${widget.data.albumId} & The Photo ID is ${widget.data.id}'),
    );
  }
}


