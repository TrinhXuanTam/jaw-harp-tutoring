import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jews_harp/core/constants.dart';

class RoundedInputField extends StatelessWidget {
  final Widget child;
  final Color color;

  const RoundedInputField({
    Key key,
    @required this.child,
    this.color = BASE_COLOR_VERY_LIGHT,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(29),
      ),
      child: this.child,
    );
  }
}
