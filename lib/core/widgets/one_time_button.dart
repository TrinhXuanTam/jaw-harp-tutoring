import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';

/// One time button that disables on click.
class OneTimeButton extends StatefulWidget {
  final String text;
  final String? inactiveText;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onPressed;

  const OneTimeButton({
    Key? key,
    required this.text,
    this.inactiveText,
    this.color = BASE_COLOR,
    this.borderColor = BASE_COLOR,
    this.textColor = Colors.white,
    required this.onPressed,
  }) : super(key: key);

  @override
  _OneTimeButtonState createState() => _OneTimeButtonState();
}

class _OneTimeButtonState extends State<OneTimeButton> {
  bool clicked = false;

  String get buttonText {
    if (!clicked)
      return this.widget.text;
    else
      return this.widget.inactiveText ?? this.widget.text;
  }

  void oneTimePress() {
    setState(() => clicked = true);
    this.widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      text: this.buttonText,
      color: clicked ? Colors.transparent : this.widget.color,
      borderColor: clicked ? Colors.grey : this.widget.borderColor,
      textColor: clicked ? Colors.grey : this.widget.textColor,
      onPressed: clicked ? null : oneTimePress,
    );
  }
}
