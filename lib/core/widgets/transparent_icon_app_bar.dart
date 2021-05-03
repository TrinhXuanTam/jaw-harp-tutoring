import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';

/// Custom transparent appbar.
class IconAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color titleColor;
  final VoidCallback? onPressed;
  final List<Widget> actions;
  final String title;

  const IconAppBar({
    Key? key,
    this.icon = Icons.arrow_back_rounded,
    this.iconColor = BASE_COLOR,
    this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.actions = const [],
    this.title = "",
    this.titleColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: this.backgroundColor,
      title: Text(
        this.title,
        style: TextStyle(color: this.titleColor),
      ),
      leading: IconButton(
        onPressed: this.onPressed,
        icon: Icon(
          this.icon,
          color: this.iconColor,
          size: 35,
        ),
      ),
      actions: this.actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
