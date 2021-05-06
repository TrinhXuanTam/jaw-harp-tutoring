import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';

/// Loading screen widget.
class LoadingScreen extends StatelessWidget {
  final bool showCloseButton;

  const LoadingScreen({Key? key, this.showCloseButton = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: showCloseButton
          ? IconAppBar(
              onPressed: () => Navigator.pop(context),
              icon: Icons.close_rounded,
              backgroundColor: Colors.transparent,
              iconColor: Colors.white.withOpacity(0.5),
            )
          : null,
      body: Container(
        decoration: const BoxDecoration(
          gradient: const LinearGradient(
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
        child: const SpinKitPulse(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
