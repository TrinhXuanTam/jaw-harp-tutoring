import 'package:flutter/material.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/small_technique_card.dart';

/// Technique side scroll list.
class TechniqueSideScroll extends StatelessWidget {
  final List<String> techniqueIds;
  final String? title;

  factory TechniqueSideScroll.fromTechniques(List<Technique> techniques, {String? title}) {
    return TechniqueSideScroll(techniqueIds: techniques.map((e) => e.id).toList(), title: title);
  }

  const TechniqueSideScroll({Key? key, required this.techniqueIds, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (this.title != null)
          Container(
            child: Text(
              this.title!,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        Container(
          height: 170,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
            itemCount: techniqueIds.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20),
            itemBuilder: (ctx, index) => SmallTechniqueCard(techniqueId: techniqueIds[index], width: 160),
          ),
        ),
      ],
    );
  }
}

class TechniqueSideScrollLoading extends StatelessWidget {
  const TechniqueSideScrollLoading();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, _) => const SizedBox(width: 20),
        itemBuilder: (ctx, index) => const SmallTechniqueCardLoading(width: 160),
      ),
    );
  }
}
