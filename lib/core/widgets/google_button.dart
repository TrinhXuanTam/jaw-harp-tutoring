import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/locations.dart';

import '../l10n.dart';

class GoogleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const GoogleButton({
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
      child: InkWell(
        onTap: this.onPress,
        child: Ink(
          child: Container(
            width: size.width * 0.7,
            padding: EdgeInsets.all(size.width * 0.02),
            child: Row(
              children: [
                Image.asset(GOOGLE_ICON_LOCATION, width: size.width * 0.075),
                SizedBox(width: size.width * 0.025),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      l10n.translate(this.text),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
