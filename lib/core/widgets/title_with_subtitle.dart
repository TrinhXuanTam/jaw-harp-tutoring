import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';

class TitleWithSubtitle extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final double titleSize;
  final double subtitleSize;
  final Color titleColor;
  final Color subtitleColor;

  const TitleWithSubtitle({
    Key? key,
    required this.titleText,
    required this.subtitleText,
    this.titleSize = 45,
    this.subtitleSize = 16,
    this.titleColor = Colors.black,
    this.subtitleColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Column(
      children: [
        Text(
          l10n.translate(this.titleText),
          style: TextStyle(
            color: this.titleColor,
            fontWeight: FontWeight.bold,
            fontSize: this.titleSize,
          ),
        ),
        Text(
          l10n.translate(this.subtitleText),
          style: TextStyle(
            color: this.subtitleColor,
            fontSize: this.subtitleSize,
          ),
        ),
      ],
    );
  }
}
