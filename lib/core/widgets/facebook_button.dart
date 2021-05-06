import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/locations.dart';

import '../l10n.dart';

/// Big Facebook auth button.
class FacebookButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const FacebookButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
                    l10n.translate(this.text),
                    style: const TextStyle(
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
