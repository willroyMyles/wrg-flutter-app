import 'package:flutter/material.dart';
import 'package:wrg2/backend/models/post.model.dart';

class ImageForCategory extends StatelessWidget {
  final PostModel item;

  const ImageForCategory({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: Container(
        height: 80,
        width: 80,
        child: Image.asset(
          GetImage(),
          fit: BoxFit.fill,
          colorBlendMode: BlendMode.color,
        ),
      ),
    );
  }

  String GetImage() {
    String str = "assets/images/edited/";
    switch (item.category) {
      case "Engine":
        str += "engine.png";
        break;
      case "Body Parts":
        str += "body light.png";
        break;
      case "Transmission":
        str += "tran.png";

        break;
      case "Wheels & Rims":
        str += "tyres.png";

        break;
      case "Accessories":
        str += "accessories.png";

        break;
      case "Misc":
        str += "misc.png";

        break;

      default:
        str += "misc.png";
    }

    return str;
  }
}
