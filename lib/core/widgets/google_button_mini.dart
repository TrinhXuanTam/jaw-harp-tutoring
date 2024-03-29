import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/locations.dart';

/// Small Google auth button.
class GoogleButtonMini extends StatelessWidget {
  final double iconWidth;
  final VoidCallback onPress;

  const GoogleButtonMini({
    Key? key,
    this.iconWidth = 45,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(29),
      child: Image.asset(GOOGLE_ICON_LOCATION, width: this.iconWidth),
      onTap: this.onPress,
    );
  }
}
