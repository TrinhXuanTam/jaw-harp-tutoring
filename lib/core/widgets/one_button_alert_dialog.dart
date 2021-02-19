import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n/app_localizations.dart';
import 'package:jews_harp/core/utils/constants.dart';

class OneButtonAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;

  const OneButtonAlertDialog({
    @required this.title,
    @required this.message,
    this.buttonText = "OK",
  });

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(29)),
      ),
      title: Text(
        localizations.translate(this.title),
        style: TextStyle(color: BASE_COLOR),
      ),
      content: Text(localizations.translate(this.message)),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            localizations.translate(this.buttonText),
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
