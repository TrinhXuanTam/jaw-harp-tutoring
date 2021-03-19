import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/Categories/categories_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocProvider<CategoriesBloc>(
      create: (_) => serviceLocator<CategoriesBloc>()..add(LoadCategories()),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (ctx, state) {
          if (state is CategoriesLoaded)
            return Scaffold(
              appBar: IconAppBar(
                icon: Icons.close_rounded,
                iconColor: BASE_COLOR,
                onPressed: () => Navigator.pop(context),
              ),
              body: CenteredStack(
                children: [
                  Column(
                    children: [
                      TitleWithSubtitle(
                        titleText: "Categories",
                        subtitleText: "Filter techniques by category",
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          child: Scrollbar(
                            child: StaggeredGridView.countBuilder(
                              crossAxisCount: 4,
                              itemCount: state.categories.length + 1,
                              itemBuilder: (BuildContext context, int index) {
                                if (index == 0)
                                  return Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: index == 0 ? BASE_COLOR : Colors.white,
                                      border: Border.all(color: Colors.grey[300]!),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          l10n.translate("All"),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: index == 0 ? Colors.white : BASE_COLOR,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          l10n.translate("View all techniques"),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: index == 0 ? Colors.white : Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "${state.categories.fold<int>(0, (acc, element) => acc + element.techniqueIds.length)} " + "items",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: index == 0 ? Colors.white : BASE_COLOR,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                else
                                  return Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: index - 1 == 0 ? BASE_COLOR : Colors.white,
                                      border: Border.all(color: Colors.grey[300]!),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.categories[index - 1].getLocalizedTitle(l10n.locale.languageCode),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: index - 1 == 0 ? Colors.white : BASE_COLOR,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          state.categories[index - 1].getLocalizedDescription(l10n.locale.languageCode),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: index - 1 == 0 ? Colors.white : Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "${state.categories[index - 1].techniqueIds.length} " + "items",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: index - 1 == 0 ? Colors.white : BASE_COLOR,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                              },
                              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          else
            return LoadingScreen();
        },
      ),
    );
  }
}
