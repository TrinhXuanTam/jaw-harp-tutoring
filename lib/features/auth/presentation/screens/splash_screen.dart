import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:jews_harp/core/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        child: SvgPicture.asset(
          LOGO_LOCATION,
          color: Colors.white,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.25,
        ),
      ),
    );
  }
}
