import 'package:flutter/widgets.dart';

class CenteredStack extends StatelessWidget {
  final List<Widget> children;

  const CenteredStack({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: this.children,
      ),
    );
  }
}
