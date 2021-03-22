import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/new_techniques/new_techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/big_technique_list.dart';
import 'package:jews_harp/features/user_section/utils.dart';

import 'category_side_scroll.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewTechniquesBloc>(
      create: (_) => serviceLocator<NewTechniquesBloc>()..add(LoadNewTechniques()),
      child: CenteredStack(
        children: [
          Container(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, " + getUser(context).name + "!",
                    style: TextStyle(fontWeight: FontWeight.bold, color: BASE_COLOR, fontSize: 17),
                  ),
                  Text(
                    "Are you ready to learn new techniques?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(height: 20),
                  CategorySideScroll(),
                  SizedBox(height: 5),
                  Container(
                    child: Text(
                      "New Techniques",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: BlocBuilder<NewTechniquesBloc, NewTechniquesState>(
                      builder: (ctx, state) {
                        if (state is NewTechniquesLoaded)
                          return BigTechniqueList(
                            techniques: state.techniques,
                            showCategory: true,
                          );
                        else
                          return BigTechniqueList(isLoading: true);
                      },
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
