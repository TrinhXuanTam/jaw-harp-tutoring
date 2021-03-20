import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

class TechniqueList extends StatelessWidget {
  final List<Technique> techniques;

  const TechniqueList({Key? key, required this.techniques}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New Techniques",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: () => {},
              child: Icon(Icons.sort_rounded, color: BASE_COLOR),
            ),
          ],
        ),
      ],
    );
  }
}
