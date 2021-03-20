import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/new_techniques/new_techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/technique_list.dart';

import '../../utils.dart';
import 'category_side_scroll.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenteredStack(
      children: [
        Container(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.only(
              right: 20,
              top: 40,
              left: 20,
              bottom: 20,
            ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "New Techniques",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
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
                SizedBox(height: 10),
                Expanded(
                  child: BlocProvider<NewTechniquesBloc>(
                    create: (_) => serviceLocator<NewTechniquesBloc>()..add(LoadNewTechniques()),
                    child: BlocBuilder<NewTechniquesBloc, NewTechniquesState>(
                      builder: (ctx, state) {
                        if (state is NewTechniquesLoaded)
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
    );
  }
}
