import 'package:flutter/material.dart';
import '../constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color, textColor, borderColor;

  const RoundedButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.color = BASE_COLOR,
    this.textColor = Colors.white,
    this.borderColor = BASE_COLOR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29),
          side: BorderSide(color: this.borderColor),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        color: this.color,
        onPressed: this.onPressed,
        child: Text(
          this.text,
          style: TextStyle(color: this.textColor),
        ),
      ),
    );
  }
}
