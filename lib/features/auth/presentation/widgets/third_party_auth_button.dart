import 'package:flutter/material.dart';

class ThirdPartyAuthButton extends StatelessWidget {
  final Function onPressed;
  final List<Color> colors;
  final Widget icon;

  const ThirdPartyAuthButton({
    Key key,
    @required this.icon,
    @required this.colors,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: this.colors,
          tileMode: TileMode.clamp,
        ),
      ),
      child: RawMaterialButton(
        shape: CircleBorder(),
        onPressed: this.onPressed,
        child: this.icon,
      ),
    );
  }
}
