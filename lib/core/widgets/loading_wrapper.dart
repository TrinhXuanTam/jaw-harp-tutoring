import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
        icon: Icons.close_rounded,
        backgroundColor: Colors.transparent,
        iconColor: Colors.white.withOpacity(0.5),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              BASE_COLOR,
              BASE_COLOR_LIGHT,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SpinKitPulse(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
