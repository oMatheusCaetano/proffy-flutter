import 'package:flutter/material.dart';

import 'package:proffy/utils/image_resolver.dart' as image;

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 25),
          child: image.assetImg(image.logo, height: 15),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
