import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/shimmer_effect.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/user_section.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/categories_screen_body.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/category_card.dart';

/// Category side scroll list.
class CategorySideScroll extends StatelessWidget {
  const CategorySideScroll();

  /// Build category list.
  Widget _buildCategories(BuildContext context, List<Category> categories) {
    final l10n = AppLocalizations.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        itemCount: categories.length + 1,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10),
        itemBuilder: (ctx, index) {
          if (index != 0) {
            final category = categories[index - 1];

            return CategoryCard.fromCategory(category: category);
          } else {
            final techniqueIds = categories.map((category) => category.techniqueIds).expand((e) => e).toList();
            return CategoryCard(
              title: l10n.translate("All Techniques"),
              description: l10n.translate("View all techniques"),
              techniqueIds: techniqueIds,
            );
          }
        },
      ),
    );
  }

  /// Shimmer loading effect.
  Widget _loadingEffect() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ShimmerEffect(
          child: Row(
            children: List.filled(
              10,
              CategoryCardLoading(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (ctx, state) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.translate("Categories"),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () => BlocProvider.of<UserSectionNavigationBloc>(ctx).add(
                  UserSectionNavigationEvent(body: CategoriesScreenBody(), bottomNavigatorIndex: CATEGORIES_INDEX),
                ),
                child: Text(
                  l10n.translate("View all"),
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
            child: state is CategoriesLoaded ? _buildCategories(context, state.categories) : _loadingEffect(),
          ),
        ],
      ),
    );
  }
}
