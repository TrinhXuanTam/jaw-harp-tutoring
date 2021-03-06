import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';

class TitleWithSubtitle extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final double titleSize;
  final double subtitleSize;

  const TitleWithSubtitle({
    Key? key,
    required this.titleText,
    required this.subtitleText,
    this.titleSize = 45,
    this.subtitleSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Column(
      children: [
        Text(
          l10n.translate(this.titleText),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: this.titleSize,
          ),
        ),
        Text(
          l10n.translate(this.subtitleText),
          style: TextStyle(
            color: Colors.grey,
            fontSize: this.subtitleSize,
          ),
        ),
      ],
    );
  }
}
