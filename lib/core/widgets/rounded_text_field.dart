import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/rounded_input_field_container.dart';

/// Rounded text field.
class RoundedTextField extends StatelessWidget {
  final String placeholderText;
  final IconData icon;
  final Color color;
  final Color iconColor;
  final TextEditingController controller;
  final EdgeInsets padding;
  final void Function(String newValue)? onChanged;

  const RoundedTextField({
    Key? key,
    this.placeholderText = "",
    required this.icon,
    this.color = BASE_COLOR_VERY_LIGHT,
    this.iconColor = BASE_COLOR,
    required this.controller,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedInputField(
      padding: this.padding,
      color: this.color,
      child: TextField(
        controller: this.controller,
        onChanged: this.onChanged,
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
