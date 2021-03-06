import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final imageLocation;
  final Function onPressed;

  const ImageButton({Key key, this.imageLocation, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.asset(this.imageLocation),
    );
  }
}
