import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:jews_harp/core/utils/colors.dart';
import 'package:jews_harp/features/login/domain/entities/user.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User _user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomColors.baseColor,
              CustomColors.baseColorLight,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            color: Colors.white,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.25,
          ),
        ),
      ),
    );
  }
}
