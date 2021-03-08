import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jews_harp/core/constants/theme.dart';

class RoundedInputField extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;
  final double? height;

  const RoundedInputField({
    Key? key,
    required this.child,
    this.color = BASE_COLOR_VERY_LIGHT,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(29),
      child: Container(
        padding: padding,
        width: size.width * 0.8,
        height: this.height,
        color: this.color,
        child: this.child,
      ),
    );
  }
}
