import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/locations.dart';

class FacebookButtonMini extends StatelessWidget {
  final double iconWidth;
  final Function onPress;

  const FacebookButtonMini({
    Key key,
    this.iconWidth = 45,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(29),
      child: Image.asset(FACEBOOK_ICON_LOCATION, width: this.iconWidth),
      onTap: this.onPress,
    );
  }
}
