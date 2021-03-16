import 'package:flutter/material.dart';

import 'package:proffy/src/view/widgets/button/tall_button/styles.dart';

class TallButton extends StatelessWidget with TallButtonStyles {
  final String text;
  final Widget top;
  final double height;
  final double width;
  final Color color;
  final void Function() onTap;

  TallButton(
    this.text, {
    Key key,
    this.height = 160,
    this.width = 140,
    this.top,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: height,
        width: width,
        child: ElevatedButton(
          style: buttonStyle(color),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              top ?? SizedBox.shrink(),
              Spacer(),
              Text(text, style: textStyle()),
            ],
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
