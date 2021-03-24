import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/filter_screen.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/small_technique_card.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class DefaultCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TechniquesBloc>(
      create: (_) => serviceLocator<TechniquesBloc>()..add(LoadAllTechniques()),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IconAppBar(
        title: "All Techniques",
        titleColor: Colors.white,
        iconColor: Colors.white,
        onPressed: () => Navigator.pop(context),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, FILTER_SCREEN_ROUTE, arguments: FilterScreenArgs(BlocProvider.of<TechniquesBloc>(context))),
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: getRandomShade("All Techniques".hashCode),
      body: CenteredStack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      color: getRandomShade("All Techniques".hashCode),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Container(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              child: Text(
                                "All Techniques",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              child: Text(
                                "View all techniques",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    child: BlocBuilder<TechniquesBloc, TechniquesState>(
                      builder: (ctx, state) {
                        if (state is TechniquesLoaded)
                          return StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            itemCount: state.techniques.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: SmallTechniqueCard(
                                  technique: state.techniques[index],
                                ),
                              );
                            },
                            staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                          );
                        else
                          return StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: SmallTechniqueCardLoading(width: 160),
                              );
                            },
                            staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                          );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
