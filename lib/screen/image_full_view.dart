
import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

class  ImageFullView extends StatelessWidget {

  final String url;

  const ImageFullView(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {Navigator.of(context).pop();},
        child: PhotoView(imageProvider: NetworkImage(url))
    );
  }
}
