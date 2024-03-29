import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';

/// Generic rounded button.
class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color, textColor, borderColor;

  const RoundedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color = BASE_COLOR,
    this.textColor = Colors.white,
    this.borderColor = BASE_COLOR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context);

    return Container(
      width: size.width * 0.8,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
            side: BorderSide(color: this.borderColor),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          backgroundColor: this.color,
        ),
        onPressed: this.onPressed,
        child: FittedBox(
          child: Text(
            l10n.translate(this.text),
            style: TextStyle(color: this.textColor),
          ),
        ),
      ),
    );
  }
}
