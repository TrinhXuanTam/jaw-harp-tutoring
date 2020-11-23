import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';

import 'package:jews_harp/core/utils/constants.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO implement BLoC
    return BlocProvider(
      create: (BuildContext ctx) => dependencyInjectionContainer<AuthBloc>(),
      child: Container(),
    );
  }
}

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   User _user;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Constants.baseColor,
//               Constants.baseColorLight,
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: SvgPicture.asset(
//             Constants.logoLocation,
//             color: Colors.white,
//             alignment: Alignment.center,
//             width: MediaQuery.of(context).size.width * 0.25,
//           ),
//         ),
//       ),
//     );
//   }
// }
