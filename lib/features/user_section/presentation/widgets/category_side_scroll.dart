import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/shimmer_effect.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/category_screen.dart';
import 'package:jews_harp/features/user_section/presentation/screens/default_category_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class CategorySideScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    Widget _buildHeader(BuildContext ctx, CategoriesState state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Categories",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          if (state is CategoriesLoaded)
            GestureDetector(
              onTap: () => BlocProvider.of<UserSectionNavigationBloc>(ctx).add(NavigateToCategoriesPage(
                categories: state.categories,
                transition: defaultFadeThroughTransition,
              )),
              child: Text(
                "View all",
                style: TextStyle(
                  color: BASE_COLOR,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          if (!(state is CategoriesLoaded)) Container(),
        ],
      );
    }

    OpenContainer _containerTransition(Color color, Widget src, Widget dst) {
      return OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        openColor: color,
        middleColor: color,
        transitionType: ContainerTransitionType.fadeThrough,
        openBuilder: (ctx, _) => dst,
        closedBuilder: (ctx, openContainer) => GestureDetector(
          onTap: openContainer,
          child: src,
        ),
      );
    }

    Widget _buildDefaultCategory(List<Category> categories) {
      final color = getRandomShade("All Techniques".hashCode);
      return _containerTransition(
        color,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            color: color,
          ),
          padding: const EdgeInsets.all(15),
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${categories.fold<int>(0, (previousValue, element) => previousValue + element.techniqueIds.length)}",
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
        ),
        DefaultCategoryScreen(),
      );
    }

    Widget _buildCategories(List<Category> categories) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.separated(
          itemCount: categories.length + 1,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10),
          itemBuilder: (ctx, index) {
            if (index != 0) {
              final color = categories[index - 1].getColor(context);

              return Container(
                child: _containerTransition(
                  color,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: color,
                    ),
                    padding: const EdgeInsets.all(15),
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${categories[index - 1].techniqueIds.length}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          categories[index - 1].title(ctx),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CategoryScreen(category: categories[index - 1]),
                ),
              );
            } else
              return _buildDefaultCategory(categories);
          },
        ),
      );
    }

    Widget _loadingEffect() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ShimmerEffect(
            child: Row(
              children: List.filled(
                3,
                Container(
                  height: 130,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: Colors.grey[300]!,
                  ),
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(15),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return BlocProvider<CategoriesBloc>(
      create: (_) => serviceLocator<CategoriesBloc>()..add(LoadCategories()),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (ctx, state) => Column(
          children: [
            _buildHeader(ctx, state),
            Container(
              height: 130,
              width: double.infinity,
              child: state is CategoriesLoaded ? _buildCategories(state.categories) : _loadingEffect(),
            ),
          ],
        ),
      ),
    );
  }
}
