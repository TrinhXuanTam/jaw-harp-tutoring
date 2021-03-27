import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/shimmer_effect.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/category_screen.dart';
import 'package:jews_harp/features/user_section/presentation/screens/default_category_screen.dart';
import 'package:jews_harp/features/user_section/presentation/screens/user_section.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/categories_screen_body.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/category_transition_wrapper.dart';
import 'package:jews_harp/features/user_section/utils.dart';
import 'package:optional/optional.dart';

class CategorySideScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          GestureDetector(
            onTap: () => BlocProvider.of<UserSectionNavigationBloc>(ctx).add(
              UserSectionNavigationEvent(body: CategoriesScreenBody(), bottomNavigatorIndex: CATEGORIES_INDEX),
            ),
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
              final category = categories[index - 1];
              final color = category.getColor(context);

              return _CategoryCard(
                color: color,
                techniquesCnt: category.techniqueIds.length,
                thumbnail: category.thumbnail,
                title: category.title,
                dst: CategoryScreen(category: category),
              );
            } else
              return _CategoryCard(
                color: getRandomShade("All Techniques".hashCode),
                techniquesCnt: categories.fold<int>(0, (previousValue, element) => previousValue + element.techniqueIds.length),
                title: "All Techniques",
                dst: DefaultCategoryScreen(categories: categories),
              );
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
                10,
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

    return BlocBuilder<CategoriesBloc, CategoriesState>(
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
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final Color color;
  final int techniquesCnt;
  final Optional<Media> thumbnail;
  final String title;
  final Widget dst;

  const _CategoryCard({
    Key? key,
    required this.color,
    required this.techniquesCnt,
    this.thumbnail = const Optional.empty(),
    required this.title,
    required this.dst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: CategoryTransitionWrapper(
        color: this.color,
        src: Stack(
          children: [
            if (thumbnail.isPresent)
              ClipRRect(
                borderRadius: BorderRadius.circular(19),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: FittedBox(fit: BoxFit.cover, child: getImageFromMedia(thumbnail.value)),
                ),
              ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: thumbnail.isPresent ? this.color.withOpacity(0.8) : this.color,
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${this.techniquesCnt}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    this.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        dst: this.dst,
      ),
    );
  }
}
