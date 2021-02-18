import 'package:flutter/material.dart';
import 'package:jews_harp/core/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color, textColor;

  const RoundedButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.color = BASE_COLOR,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: this.color,
          onPressed: this.onPressed,
          child: Text(
            this.text,
            style: TextStyle(color: this.textColor),
          ),
        ),
      ),
    );
  }
}
