import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';

class TextDivider extends StatelessWidget {
  final String text;

  Expanded _renderLine() {
    return Expanded(
      child: Divider(
        color: BASE_COLOR,
        height: 1.5,
      ),
    );
  }

  const TextDivider({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            _renderLine(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                this.text,
                style: TextStyle(
                  color: BASE_COLOR,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _renderLine(),
          ],
        ),
      ),
    );
  }
}
