import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/settings.dart';
import 'package:jews_harp/core/constants/theme.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        // render linear gradient background
        gradient: LinearGradient(
          colors: [
            BASE_COLOR,
            BASE_COLOR_LIGHT,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        // render logo picture
        child: Image.asset(
          LOGO_LOCATION,
          color: Colors.white,
          alignment: Alignment.center,
          width: size.width * 0.5,
        ),
      ),
    );
  }
}
