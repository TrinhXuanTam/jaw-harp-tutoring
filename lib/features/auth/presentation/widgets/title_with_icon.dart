import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';

/// title with an icon positioned under.
class TitleWithIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final String title;

  const TitleWithIcon({
    Key? key,
    required this.icon,
    this.iconColor = BASE_COLOR,
    this.iconSize = 150,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Column(
      children: [
        Icon(
          this.icon,
          size: this.iconSize,
          color: this.iconColor,
        ),
        Text(
          l10n.translate(this.title),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ],
    );
  }
}
