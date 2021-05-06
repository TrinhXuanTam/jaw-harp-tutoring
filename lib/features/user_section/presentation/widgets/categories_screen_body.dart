import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jews_harp/core/BLoCs/connectivity/connectivity_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/no_internet_widget.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/big_category_card.dart';

/// Big category list screen.
class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is NoInternetConnection) return const NoInternetWidget();
        return CenteredStack(
          children: [
            BlocBuilder<CategoriesBloc, CategoriesState>(builder: (ctx, state) {
              if (state is CategoriesLoaded)
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Scrollbar(
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      itemCount: state.categories.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          final techniqueIds = state.categories.map((category) => category.techniqueIds).expand((e) => e).toList();
                          return BigCategoryCard(
                            title: l10n.translate("All Techniques"),
                            description: l10n.translate("View all techniques"),
                            techniqueIds: techniqueIds,
                          );
                        } else {
                          return BigCategoryCard.fromCategory(
                            category: state.categories[index - 1],
                          );
                        }
                      },
                      staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                  ),
                );
              else
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: const SpinKitPulse(
                    color: BASE_COLOR,
                    size: 100,
                  ),
                );
            }),
          ],
        );
      },
    );
  }
}
