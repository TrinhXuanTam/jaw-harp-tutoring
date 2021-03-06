import 'package:flutter/material.dart';

class FullScreenContainer extends StatelessWidget {
  final Widget child;

  const FullScreenContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: this.child,
    );
  }
}
