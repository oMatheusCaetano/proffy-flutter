import 'package:flutter/material.dart';
import 'package:proffy/src/view/widgets/input/styles.dart';

class Input extends StatelessWidget with InputStyles {
  final String label;
  final double height;
  final double width;
  final bool obscure;
  final bool light;
  final String initialValue;
  final EdgeInsets margin;
  final TextInputType keyboardType;
  final void Function(String) onChanged;
  final String Function(String) validator;

  Input({
    Key key,
    this.label = '',
    this.height = 56,
    this.width = double.infinity,
    this.margin,
    this.onChanged,
    this.obscure = false,
    this.validator,
    this.light = false,
    this.initialValue,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle(light)),
        SizedBox(height: 4),
        TextFormField(
          keyboardType: keyboardType,
          initialValue: initialValue,
          validator: validator,
          obscureText: obscure,
          decoration: inputDecoration(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
