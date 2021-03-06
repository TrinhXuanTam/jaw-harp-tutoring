import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';

class BigAppBarBackground extends StatelessWidget {
  final double? height;
  final Widget? child;

  const BigAppBarBackground({
    Key? key,
    this.height,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      height: this.height,
      width: size.width,
      decoration: BoxDecoration(
        color: BASE_COLOR,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(29),
          bottomRight: Radius.circular(29),
        ),
      ),
      child: this.child,
    );
  }
}
