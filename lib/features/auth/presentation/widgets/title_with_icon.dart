import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';

class TitleWithIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return Column(
      children: [
        Icon(
          Icons.check_circle_outline_sharp,
          size: 150,
          color: Colors.green,
        ),
        Text(
          localizations.translate("Account Created"),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ],
    );
  }
}