import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/locations.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/shimmer_effect.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique/technique_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/technique_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class SmallTechniqueList extends StatelessWidget {
  final List<String> techniquesIds;

  const SmallTechniqueList({
    Key? key,
    required this.techniquesIds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: techniquesIds.length,
      itemBuilder: (ctx, index) {
        final id = techniquesIds[index];
        late Widget thumbnail;

        return BlocProvider<TechniqueBloc>(
          create: (ctx) => serviceLocator<TechniqueBloc>()..add(LoadTechnique(id)),
          child: BlocBuilder<TechniqueBloc, TechniqueState>(
            builder: (ctx, state) {
              if (state is TechniqueLoaded) {
                final technique = state.technique;
                final user = getUser(ctx);

                if (technique.thumbnail.isPresent)
                  thumbnail = FittedBox(
                    fit: BoxFit.cover,
                    child: getImageFromMedia(technique.thumbnail.value),
                  );
                else
                  thumbnail = Container(
                    padding: const EdgeInsets.all(20),
                    color: BASE_COLOR,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(
                        LOGO_LOCATION,
                        width: 30,
                      ),
                    ),
                  );

                return GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, TECHNIQUE_DETAIL_SCREEN_ROUTE, arguments: TechniqueScreenArgs(technique)),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            child: Container(
                              width: 150,
                              height: double.infinity,
                              child: thumbnail,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  technique.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.timelapse_rounded,
                                                  color: BASE_COLOR,
                                                  size: 15,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  technique.difficulty.string,
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 4),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.attach_money_rounded,
                                                  color: BASE_COLOR,
                                                  size: 15,
                                                ),
                                                SizedBox(width: 4),
                                                // TODO
                                                Text(
                                                  technique.productId.isPresent ? "99.99\$" : "Free",
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        user.favoriteTechniques.contains(technique.id) ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                        color: BASE_COLOR,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else
                return _LoadingEffect();
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10),
    );
  }
}

class _LoadingEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 100,
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: Container(
                  width: 150,
                  height: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 13,
                      width: 100,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timelapse_rounded,
                                      color: BASE_COLOR,
                                      size: 15,
                                    ),
                                    SizedBox(width: 4),
                                    Container(
                                      height: 12,
                                      width: 50,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.attach_money_rounded,
                                      color: BASE_COLOR,
                                      size: 15,
                                    ),
                                    SizedBox(width: 4),
                                    Container(
                                      height: 12,
                                      width: 50,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.redAccent,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
