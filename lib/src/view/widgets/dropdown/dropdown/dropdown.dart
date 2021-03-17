import 'package:flutter/material.dart';
import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/src/view/widgets/dropdown/dropdown/styles.dart';

class DropDown extends StatelessWidget with DropDownStyles {
  final String label;
  final String placeholder;
  final String value;
  final List<DropdownMenuItem<String>> items;
  final void Function(String) onChanged;
  final double height;
  final double width;
  final EdgeInsets margin;

  DropDown({
    Key key,
    this.label = '',
    this.placeholder = '',
    this.onChanged,
    this.height = 56,
    this.width = double.infinity,
    this.margin,
    this.items,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: filterLabelStyle()),
        SizedBox(height: 4),
        Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Pallete.background,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: value,
              onChanged: onChanged,
              hint: Text(placeholder, style: filterInputPlaceholderStyle()),
              items: items,
            ),
          ),
        ),
      ],
    );
  }
}
