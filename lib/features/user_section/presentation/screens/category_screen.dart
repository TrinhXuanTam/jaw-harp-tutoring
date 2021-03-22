import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/technique_list.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/technique_search_bar.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryColor = this.category.getColor(context);

    return Scaffold(
      appBar: IconAppBar(
        iconColor: Colors.white,
        icon: Icons.close_rounded,
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: categoryColor,
      body: CenteredStack(
        children: [
          BlocProvider<TechniquesBloc>(
            create: (_) => serviceLocator<TechniquesBloc>()..add(LoadTechniquesByCategory(category)),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.title(context),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          category.description(context),
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TechniqueSearchBar(),
                            Icon(
                              Icons.sort_rounded,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
          ),
        ],
      ),
    );
  }
}
