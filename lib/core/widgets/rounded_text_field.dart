import 'package:flutter/material.dart';
import 'package:jews_harp/core/utils/constants.dart';
import 'package:jews_harp/core/widgets/rounded_input_field_container.dart';

class RoundedTextField extends StatelessWidget {
  final String placeholderText;
  final IconData icon;
  final Color color;
  final Color iconColor;

  const RoundedTextField({
    Key key,
    this.placeholderText = "",
    @required this.icon,
    this.color = BASE_COLOR_VERY_LIGHT,
    this.iconColor = BASE_COLOR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedInputField(
      color: this.color,
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            this.icon,
            color: this.iconColor,
          ),
          hintText: this.placeholderText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
