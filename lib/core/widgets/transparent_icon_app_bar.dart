import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';

class IconAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Function onPressed;
  final Text text;

  const IconAppBar({
    Key key,
    this.icon = Icons.arrow_back_rounded,
    this.iconColor = BASE_COLOR,
    @required this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: this.backgroundColor,
      leading: IconButton(
        onPressed: this.onPressed,
        icon: Icon(
          this.icon,
          color: this.iconColor,
          size: 35,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
