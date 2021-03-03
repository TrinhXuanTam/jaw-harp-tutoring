import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';

class BigAppBarBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        height: size.height * 0.2,
        width: size.width,
        decoration: BoxDecoration(
          color: BASE_COLOR,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(29),
            bottomRight: Radius.circular(29),
          ),
        ),
      ),
    );
  }
}
