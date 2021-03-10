import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';

class OneButtonAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onPressed;

  const OneButtonAlertDialog({
    Key? key,
    required this.title,
    required this.message,
    this.buttonText = "OK",
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(29)),
      ),
      title: Text(
        l10n.translate(this.title),
        style: TextStyle(color: BASE_COLOR),
      ),
      content: Text(l10n.translate(this.message)),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            l10n.translate(this.buttonText),
            style: TextStyle(
              color: BASE_COLOR,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
