import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

class TechniqueScreen extends StatelessWidget {
  final Technique technique;

  const TechniqueScreen({
    Key? key,
    required this.technique,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
