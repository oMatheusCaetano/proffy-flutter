import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String url;

  ProfileImage(this.url, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.network(url, height: 64, width: 64),
    );
  }
}
