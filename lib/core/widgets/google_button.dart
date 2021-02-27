import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/locations.dart';

import '../l10n.dart';

class GoogleButton extends StatelessWidget {
  final String text;
  final Function onPress;

  const GoogleButton({
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
      child: Container(
        width: size.width * 0.7,
        child: InkWell(
          onTap: this.onPress,
          child: Ink(
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset(GOOGLE_ICON_LOCATION, width: size.width * 0.075),
                  SizedBox(width: size.width * 0.025),
                  Text(
                    localizations.translate(this.text),
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
