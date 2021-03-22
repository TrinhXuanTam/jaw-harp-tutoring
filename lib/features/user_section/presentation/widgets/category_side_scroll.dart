import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/shimmer_effect.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/category_screen.dart';
import 'package:jews_harp/features/user_section/presentation/screens/default_category_screen.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/lazy_load_techniques_wrapper.dart';
import 'package:jews_harp/features/user_section/utils.dart';

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
                loadEvent: LoadTechniquesByCategory(category),
                techniquesCnt: category.techniqueIds.length,
                title: category.title(ctx),
                openBuilder: (TechniquesBloc bloc) => CategoryScreen(category: category, techniquesBloc: bloc),
              );
            } else
              return _CategoryCard(
                color: getRandomShade("All Techniques".hashCode),
                loadEvent: LoadAllTechniques(),
                techniquesCnt: categories.fold<int>(0, (previousValue, element) => previousValue + element.techniqueIds.length),
                title: "All Techniques",
                openBuilder: (TechniquesBloc bloc) => DefaultCategoryScreen(techniquesBloc: bloc),
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

class _CategoryCard extends StatelessWidget {
  final Color color;
  final TechniquesEvent loadEvent;
  final int techniquesCnt;
  final String title;
  final Widget Function(TechniquesBloc) openBuilder;

  const _CategoryCard({
    Key? key,
    required this.color,
    required this.loadEvent,
    required this.techniquesCnt,
    required this.title,
    required this.openBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LazyLoadTechniquesWrapper(
        color: this.color,
        loadEvent: this.loadEvent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            color: this.color,
          ),
          padding: const EdgeInsets.all(15),
          width: 100,
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
        openBuilder: this.openBuilder,
      ),
    );
  }
}
