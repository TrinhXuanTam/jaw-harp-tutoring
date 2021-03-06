import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/locations.dart';

import '../l10n.dart';

class FacebookButton extends StatelessWidget {
  final String text;
  final Function onPress;

  const FacebookButton({
    Key key,
    this.text,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;

    return Material(
      elevation: 3,
      color: Color.fromARGB(255, 58, 88, 155),
      child: GestureDetector(
        onTap: this.onPress,
        child: Container(
          width: size.width * 0.7,
          padding: EdgeInsets.all(size.width * 0.02),
          child: Row(
            children: [
              Image.asset(FACEBOOK_ICON_LOCATION, width: size.width * 0.075),
              SizedBox(width: size.width * 0.025),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    localizations.translate(this.text),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}