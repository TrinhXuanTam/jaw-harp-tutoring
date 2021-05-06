import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Full screen stack that centers its children.
class CenteredStack extends StatelessWidget {
  final List<Widget> children;

  const CenteredStack({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: this.children,
      ),
    );
  }
}
