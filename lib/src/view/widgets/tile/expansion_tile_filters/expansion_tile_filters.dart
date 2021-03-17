import 'package:flutter/material.dart';

import 'package:proffy/utils/image_resolver.dart' as image;
import 'package:proffy/src/view/widgets/tile/expansion_tile_filters/styles.dart';

class ExpansiontileFilters extends StatelessWidget
    with ExpansiontileFiltersStyles {
  final String placeholder;
  final List<Widget> children;

  ExpansiontileFilters({
    Key key,
    this.placeholder,
    this.children = const <Widget>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: image.assetImg(image.filter),
      childrenPadding: EdgeInsets.fromLTRB(25, 10, 25, 20),
      title: Text(
        placeholder ?? '',
        style: filterPlaceholderStyle(),
      ),
      children: children,
    );
  }
}
