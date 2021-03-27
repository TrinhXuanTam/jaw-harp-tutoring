import 'package:flutter/material.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/small_technique_card.dart';

class TechniqueSideScroll extends StatelessWidget {
  final List<String> techniqueIds;

  factory TechniqueSideScroll.fromTechniques(List<Technique> techniques) => TechniqueSideScroll(techniqueIds: techniques.map((e) => e.id).toList());

  const TechniqueSideScroll({Key? key, required this.techniqueIds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        itemCount: techniqueIds.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) => SizedBox(width: 20),
        itemBuilder: (ctx, index) => SmallTechniqueCard(techniqueId: techniqueIds[index], width: 160),
      ),
    );
  }
}

class TechniqueSideScrollLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, _) => SizedBox(width: 20),
        itemBuilder: (ctx, index) => SmallTechniqueCardLoading(width: 160),
      ),
    );
  }
}
