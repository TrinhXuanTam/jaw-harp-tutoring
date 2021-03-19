import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/Categories/categories_bloc.dart';
import 'package:random_color/random_color.dart';

class CategorySideScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final hue = getColorNameFromColor(BASE_COLOR).getHue;

    return BlocProvider<CategoriesBloc>(
      create: (_) => serviceLocator<CategoriesBloc>()..add(LoadCategories()),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () => {},
                child: Text(
                  "View all",
                  style: TextStyle(
                    color: BASE_COLOR,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 130,
            width: double.infinity,
            child: BlocBuilder<CategoriesBloc, CategoriesState>(builder: (ctx, state) {
              if (state is CategoriesLoaded)
                return Scrollbar(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListView.builder(
                      itemCount: state.categories.length + 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        if (index != 0)
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              color: RandomColor(state.categories[index - 1].getLocalizedTitle(l10n.locale.languageCode).hashCode).randomColor(
                                colorHue: ColorHue.custom(Range(hue, hue)),
                                colorSaturation: ColorSaturation.highSaturation,
                              ),
                            ),
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(15),
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${state.categories[index - 1].techniqueIds.length}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  state.categories[index - 1].getLocalizedTitle(l10n.locale.languageCode),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          );
                        else
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              color: RandomColor("All Techniques".hashCode).randomColor(
                                colorHue: ColorHue.custom(Range(hue, hue)),
                                colorSaturation: ColorSaturation.highSaturation,
                              ),
                            ),
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(15),
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${state.categories.fold<int>(0, (previousValue, element) => previousValue + element.techniqueIds.length)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "All Techniques",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          );
                      },
                    ),
                  ),
                );
              else
                return Container();
            }),
          ),
        ],
      ),
    );
  }
}
