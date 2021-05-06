import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart';
import 'package:jews_harp/features/admin/presentation/screens/edit_technique_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/admin_scaffold.dart';
import 'package:jews_harp/features/admin/presentation/widgets/scrollable_technique_list.dart';

/// Screen that displays a list of all techniques.
class TechniqueListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider<TechniqueListBloc>(
      create: (_) => serviceLocator<TechniqueListBloc>()..add(LoadAllTechniques()),
      child: BlocBuilder<TechniqueListBloc, TechniqueListState>(
        builder: (ctx, state) {
          if (state is TechniqueListLoaded)
            return AdminScaffold(
              onClose: () => Navigator.pop(context),
              title: "Browse Techniques",
              description: "Here you can browse through techniques and manage their content.",
              body: ScrollableTechniqueList(
                items: state.techniques,
                onTap: (technique) => Navigator.pushReplacementNamed(
                  context,
                  EDIT_TECHNIQUE_SCREEN_ROUTE,
                  arguments: EditTechniqueScreenArgs(
                    technique,
                    (ctx) => Navigator.pushReplacementNamed(ctx, TECHNIQUE_LIST_SCREEN_ROUTE),
                  ),
                ),
                height: size.height * 0.7,
              ),
            );
          else
            return const LoadingScreen();
        },
      ),
    );
  }
}
