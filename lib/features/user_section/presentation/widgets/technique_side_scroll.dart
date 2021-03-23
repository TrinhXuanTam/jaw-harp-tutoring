import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/small_technique_card.dart';

class TechniqueSideScroll extends StatelessWidget {
  final TechniquesEvent loadEvent;

  const TechniqueSideScroll({Key? key, this.loadEvent = const LoadAllTechniques()}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TechniquesBloc>(
      create: (_) => serviceLocator<TechniquesBloc>()..add(this.loadEvent),
      child: BlocBuilder<TechniquesBloc, TechniquesState>(builder: (ctx, state) {
        if (state is TechniquesLoaded) {
          final techniques = state.techniques;

          return Container(
            height: 180,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.separated(
              itemCount: techniques.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) => SizedBox(width: 20),
              itemBuilder: (ctx, index) => SmallTechniqueCard(technique: techniques[index], width: 160),
            ),
          );
        } else
          return SmallTechniqueCardLoading(width: 160);
      }),
    );
  }
}
