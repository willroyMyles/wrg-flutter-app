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
        height: 60,
        width: 60,
        child: Image.asset(
          GetImage(),
          fit: BoxFit.contain,
          colorBlendMode: BlendMode.color,
        ),
      ),
    );
  }

  String GetImage() {
    String str = "assets/images/";
    switch (item.category) {
      case "Engine":
        str += "engine.png";
        break;
      case "Body Parts":
        str += "bodyparts1.jpg";
        break;
      case "Transmission":
        str += "trans.jpg";

        break;
      case "Wheels & Rims":
        str += "tyres2.png";

        break;
      case "Accessories":
        str += "accessories.png";

        break;
      case "Misc":
        str += "misc1.jpg";

        break;

      default:
        str += "misc1.jpg";
    }

    return str;
  }
}
