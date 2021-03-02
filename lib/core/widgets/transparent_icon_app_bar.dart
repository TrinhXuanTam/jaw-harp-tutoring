import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';

class TransparentIconAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData icon;
  final Color iconColor;
  final Function onPressed;

  const TransparentIconAppBar({
    Key key,
    this.icon = Icons.arrow_back_rounded,
    this.iconColor = BASE_COLOR,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
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
