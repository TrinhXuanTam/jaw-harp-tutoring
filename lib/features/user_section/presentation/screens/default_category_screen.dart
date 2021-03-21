import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/small_technique_list.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class DefaultCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IconAppBar(
        iconColor: Colors.white,
        icon: Icons.close_rounded,
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: getRandomShade("All Techniques".hashCode),
      body: CenteredStack(
        children: [
          BlocProvider<TechniquesBloc>(
            create: (_) => serviceLocator<TechniquesBloc>()..add(LoadAllTechniques()),
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
                          "All Techniques",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "View all techniques",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        ),
                        color: Colors.white,
                      ),
                      child: BlocBuilder<TechniquesBloc, TechniquesState>(
                        builder: (ctx, state) {
                          if (state is TechniquesLoaded)
                            return SmallTechniqueList(
                              techniques: state.techniques,
                              showCategory: true,
                            );
                          else
                            return SmallTechniqueList(isLoading: true);
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
