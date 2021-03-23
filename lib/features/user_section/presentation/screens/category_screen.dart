import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/filter_screen.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/technique_list.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TechniquesBloc>(
      create: (_) => serviceLocator<TechniquesBloc>()..add(LoadTechniquesByCategory(category)),
      child: _Body(
        category: this.category,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final Category category;

  const _Body({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryColor = this.category.getColor(context);

    return Scaffold(
      appBar: IconAppBar(
        title: this.category.title,
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
      backgroundColor: categoryColor,
      body: CenteredStack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    child: BlocBuilder<TechniquesBloc, TechniquesState>(
                      builder: (ctx, state) {
                        if (state is TechniquesLoaded)
                          return TechniqueList(
                            techniques: state.techniques,
                            showCategory: true,
                          );
                        else
                          return TechniqueList(isLoading: true);
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
